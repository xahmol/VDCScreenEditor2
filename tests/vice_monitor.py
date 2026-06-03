"""
VICE remote monitor wrapper for VDC Screen Editor 2 test harness.

Connects to VICE's text-mode remote monitor over TCP (launched with
-remotemonitor -remotemonitoraddress 127.0.0.1:6510) and provides
high-level operations used by the test suite.

Protocol notes:
  - VICE remote monitor is a line-oriented text protocol.
  - The monitor prompt looks like:  (C:$xxxx)
  - When a breakpoint fires VICE sends a line containing:
      #<n>  (Stop on exec breakpoint <n> in bank `cpu' at $xxxx)
    followed immediately by a new prompt.
  - Oscar64 -g writes 'br C:xxxx' entries into the .lbl file; loading the
    .lbl with 'll file.lbl' causes VICE to auto-activate those breakpoints.
  - keybuf "<str>" injects characters into the C128 keyboard buffer.
    Non-printable PETSCII codes must be sent as individual raw bytes inside
    the quoted string; Python encodes them with latin-1 so byte values pass
    through unchanged.
"""

import socket
import time
import re
import os

# Remote monitor default port
DEFAULT_PORT = int(os.environ.get("VICE_MONITOR_PORT", "6510"))
DEFAULT_HOST = "127.0.0.1"

# PETSCII codes for common special keys
PETSCII = {
    "RETURN":     "\x0d",   # 13
    "F1":         "\x85",   # 133
    "F3":         "\x86",   # 134
    "F5":         "\x87",   # 135
    "F7":         "\x88",   # 136
    "F2":         "\x89",   # 137  (Shift+F1)
    "F4":         "\x8a",   # 138
    "F6":         "\x8b",   # 139
    "F8":         "\x8c",   # 140
    "DOWN":       "\x11",   # 17
    "UP":         "\x91",   # 145
    "RIGHT":      "\x1d",   # 29
    "LEFT":       "\x9d",   # 157
    "HOME":       "\x13",   # 19
    "DEL":        "\x14",   # 20
    "STOP":       "\x03",   # 3
    "ESC":        "\x1b",   # 27 (also used as RUN/STOP on some paths)
    "SPACE":      " ",
}


class ViceMonitorError(Exception):
    pass


class ViceMonitor:
    """
    Thin wrapper around the VICE remote monitor text protocol.

    Usage::

        mon = ViceMonitor()
        mon.connect()
        mon.load_symbols("build/vdcse_test.lbl")
        mon.keybuf(PETSCII["SPACE"])           # clear title screen
        addr = mon.wait_for_break(timeout=10)  # wait for TEST_HOOK breakpoint
        data = mon.read_bank1(0x5800, 80)
        mon.cont()
        mon.disconnect()
    """

    # Compiled regex for monitor prompt: (C:$xxxx)
    _PROMPT_RE = re.compile(r"\(C:\$[0-9a-fA-F]+\)\s*$")
    # Break notification — VICE 3.8 sends:
    #   BREAK: N  C:$XXXX  (Stop on exec)
    # (Not the older format "#N (Stop on...at $XXXX)" used in older VICE docs)
    _BREAK_RE  = re.compile(
        r"BREAK:\s*(\d+)\s+C:\$([0-9a-fA-F]+)\s+\(Stop on exec\)",
        re.IGNORECASE,
    )

    def __init__(self):
        self._sock = None
        self._buf  = ""

    # ------------------------------------------------------------------
    # Connection
    # ------------------------------------------------------------------

    def connect(self, host=DEFAULT_HOST, port=DEFAULT_PORT, timeout=15):
        """Connect to VICE remote monitor and verify it responds."""
        self._sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self._sock.settimeout(timeout)
        deadline = time.monotonic() + timeout
        while True:
            try:
                self._sock.connect((host, port))
                break
            except (ConnectionRefusedError, OSError):
                if time.monotonic() > deadline:
                    raise ViceMonitorError(
                        f"Could not connect to VICE monitor at {host}:{port} "
                        f"within {timeout}s — is VICE running with -remotemonitor?"
                    )
                time.sleep(0.25)
        # The remote monitor is silent while VICE is running; it only sends
        # output in response to commands.  Send 'r' (register dump) to elicit
        # the prompt.  Then resume — 'r' leaves the CPU halted in monitor mode.
        self._recv_until_prompt(timeout=timeout, prime_with="r\n")
        self.cont()  # resume after 'r' halted the CPU

    def disconnect(self):
        if self._sock:
            try:
                self._sock.close()
            except OSError:
                pass
            self._sock = None

    # ------------------------------------------------------------------
    # Core send/receive
    # ------------------------------------------------------------------

    def cmd(self, command: str, timeout: float = 10.0, resume: bool = True) -> str:
        """
        Send a monitor command, wait for the next prompt, return all
        output lines between the command echo and the prompt.

        VICE halts the CPU while processing each command.  By default
        (resume=True) this method sends 'g' immediately after the prompt
        to resume execution.  Pass resume=False only when you intend to
        keep the CPU halted (e.g. for a sequence of commands before resuming).

        If a breakpoint fires during command processing (VICE embeds the break
        notification in the command response), the notification is saved in
        self._buf so the next wait_for_break() call finds it immediately.
        In that case the CPU is already halted at the break and we do NOT
        send 'g' regardless of the resume flag.
        """
        self._send(command + "\n")
        result = self._recv_until_prompt(timeout=timeout)
        if self._BREAK_RE.search(result):
            # Break fired during this command.  Save the notification so
            # wait_for_break() can pick it up; CPU is already halted.
            self._buf = result
            return result
        if resume:
            self.cont()
        return result

    def _send(self, text: str):
        # Encode as latin-1 so high bytes (e.g. PETSCII 0x85 for F1) pass through.
        self._sock.sendall(text.encode("latin-1"))

    def _recv_until_prompt(self, timeout: float = 10.0, prime_with: str = None) -> str:
        """Read from socket until a monitor prompt line is detected.

        If prime_with is given, send it first to elicit a response (needed when
        the CPU is running and VICE won't send anything unprompted).
        """
        if prime_with:
            self._send(prime_with)
        self._sock.settimeout(timeout)
        deadline = time.monotonic() + timeout
        while True:
            try:
                chunk = self._sock.recv(4096).decode("latin-1", errors="replace")
            except socket.timeout:
                raise ViceMonitorError(
                    f"Timed out waiting for VICE monitor prompt after {timeout}s"
                )
            if not chunk:
                raise ViceMonitorError("VICE monitor connection closed unexpectedly")
            self._buf += chunk
            if self._PROMPT_RE.search(self._buf):
                result = self._buf
                self._buf = ""
                return result
            if time.monotonic() > deadline:
                raise ViceMonitorError(
                    f"Timed out ({timeout}s) waiting for prompt; buffer: {self._buf!r}"
                )

    # ------------------------------------------------------------------
    # High-level operations
    # ------------------------------------------------------------------

    def load_symbols(self, lbl_path: str):
        """Load an Oscar64 VICE label file (ll command).

        cmd() resumes the CPU after the prompt (resume=True default), so
        the program continues running immediately after all labels are loaded.
        """
        self.cmd(f'll "{lbl_path}"')

    def keybuf(self, petscii: str):
        """
        Inject keystrokes into the C128 keyboard buffer.

        petscii may contain raw PETSCII bytes (use PETSCII dict above for
        special keys, or plain ASCII for printable characters).
        Each character is sent as a separate keybuf call to avoid quoting issues.
        """
        for ch in petscii:
            # Use \\xNN syntax for bytes VICE's parser might misinterpret
            code = ord(ch)
            if 0x20 <= code <= 0x7e and ch not in ('"', '\\'):
                self.cmd(f'keybuf "{ch}"')
            else:
                # Send as hex escape; VICE monitor accepts \xNN in keybuf strings
                self.cmd(f'keybuf "\\x{code:02x}"')

    def keybuf_sequence(self, *keys: str, delay: float = 0.05):
        """
        Inject a sequence of named keys (from PETSCII dict) or literal
        single-character strings, with a small delay between each.
        """
        for key in keys:
            ch = PETSCII.get(key, key)
            self.keybuf(ch)
            time.sleep(delay)

    def read_bank1(self, addr: int, length: int) -> bytes:
        """
        Read `length` bytes from C128 Bank 1 starting at `addr`.

        In vdcse's MMU configuration, $2000–$BFFF in the CPU's address space
        is mapped from Bank 1.  SCREENMAPBASE ($5800) falls in that range, so
        reading via the current CPU bank ('bank cpu') gives Bank 1 data.
        The VICE 3.8 C128 monitor does not expose a 'ram1' bank name.
        """
        self.cmd("bank cpu")
        end_addr = addr + length - 1
        response = self.cmd(f"m ${addr:04x} ${end_addr:04x}")
        return _parse_memory_dump(response)

    def read_bank0(self, addr: int, length: int) -> bytes:
        """Read `length` bytes from C128 Bank 0 (CPU current bank)."""
        end_addr = addr + length - 1
        response = self.cmd(f"m ${addr:04x} ${end_addr:04x}")
        return _parse_memory_dump(response)

    def set_break(self, addr_or_label: str) -> int:
        """
        Set an exec breakpoint at an address or symbol label.
        Returns the breakpoint number assigned by VICE.
        """
        response = self.cmd(f"break {addr_or_label}")
        m = re.search(r"BREAK:\s*(\d+)", response, re.IGNORECASE)
        if m:
            return int(m.group(1))
        # Fallback: look for 'Set breakpoint N'
        m = re.search(r"(\d+)", response)
        return int(m.group(1)) if m else -1

    def delete_break(self, num: int):
        """Delete a breakpoint by number."""
        self.cmd(f"del {num}")

    def wait_for_break(self, timeout: float = 20.0) -> int:
        """
        Block until VICE reports a breakpoint halt.
        Returns the PC address where it stopped, or raises ViceMonitorError.

        Checks self._buf first: cmd() saves embedded break notifications there
        when a breakpoint fires during a monitor command (e.g. keybuf triggers
        the break before cmd() returns).  If found, returns immediately.
        Otherwise reads from the socket until the notification arrives.
        """
        # Fast-path: break notification already captured by a prior cmd() call.
        m = self._BREAK_RE.search(self._buf)
        if m:
            addr = int(m.group(2), 16)
            self._buf = ""
            # Drain any trailing prompt so the socket is clean for the next cmd.
            try:
                self._recv_until_prompt(timeout=2.0)
            except ViceMonitorError:
                pass
            return addr

        self._sock.settimeout(timeout)
        deadline = time.monotonic() + timeout
        while True:
            try:
                chunk = self._sock.recv(4096).decode("latin-1", errors="replace")
            except socket.timeout:
                raise ViceMonitorError(
                    f"No breakpoint fired within {timeout}s"
                )
            if not chunk:
                raise ViceMonitorError("VICE monitor connection closed while waiting for break")
            self._buf += chunk
            m = self._BREAK_RE.search(self._buf)
            if m:
                addr = int(m.group(2), 16)
                self._buf = ""
                # Drain remainder up to the next prompt
                try:
                    self._recv_until_prompt(timeout=5.0)
                except ViceMonitorError:
                    pass
                return addr
            if time.monotonic() > deadline:
                raise ViceMonitorError(
                    f"No breakpoint fired within {timeout}s; buffer: {self._buf!r}"
                )

    def cont(self):
        """Resume execution (monitor 'g' command = go/continue)."""
        self._send("g\n")
        # Don't wait for prompt — execution resumes and monitor goes quiet
        time.sleep(0.05)

    def warp(self, on: bool):
        """Toggle VICE warp mode on or off (speeds up disk loading)."""
        self.cmd("warp on" if on else "warp off")

    def screenshot(self, path: str):
        """Save a VICE screenshot to path (PNG)."""
        self.cmd(f"screenshot {path}")

    def registers(self) -> str:
        """Return the current register dump."""
        return self.cmd("r")


# ------------------------------------------------------------------
# Internal helpers
# ------------------------------------------------------------------

def _parse_memory_dump(response: str) -> bytes:
    """
    Parse VICE monitor memory dump output into a bytes object.

    VICE dumps look like:
      >C:5800  20 41 42 43 ...  .ABC...
    Lines beginning with '>C:' or '>1:' (bank-prefixed) carry the hex data.
    """
    result = bytearray()
    for line in response.splitlines():
        # Match lines like ">C:5800  41 42 ..." or ">1:5800  41 42 ..."
        m = re.match(r">[^:]+:\s*[0-9a-fA-F]{4}\s+((?:[0-9a-fA-F]{2}\s+)+)", line)
        if m:
            for byte_str in m.group(1).split():
                result.append(int(byte_str, 16))
    return bytes(result)
