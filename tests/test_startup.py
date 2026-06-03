"""
Smoke test: verify the program boots and reaches the main editing loop.

Steps:
  1. VICE is running (program loaded via -autostart, showing title screen).
  2. Inject SPACE to dismiss the title screen (any key clears it).
  3. Set a monitor breakpoint at '.mainmenuloop' (from the Oscar64 .lbl).
  4. Inject F1 to open the main menu — this calls mainmenuloop().
  5. Assert the breakpoint fires within 8 seconds.
  6. Clean up: inject STOP to exit the menu, delete the breakpoint, resume.

If the program crashes during init, mainmenuloop() is never called and
wait_for_break() times out → test fails.

VICE label note:
  Labels from the Oscar64 .lbl file appear as '.mainmenuloop' (with leading
  dot) in VICE's label table.  The VICE monitor 'break' command accepts both
  '.mainmenuloop' and 'mainmenuloop' depending on version; we try without the
  dot first (more portable) and fall back to the address.
  The known address from the current build is $5510 (mainmenuloop entry).
  If this test fails with a timeout, check build/vdcse_test.lbl for the
  current '.mainmenuloop' address.
"""

import time
from vice_monitor import ViceMonitor, PETSCII

# Address of mainmenuloop from build/vdcse_test.lbl: al 5510 .mainmenuloop
# Update this if the binary changes significantly.
MAINMENULOOP_ADDR = "$5510"


def test_startup(mon: ViceMonitor):
    """Program boots, clears title screen, and mainmenuloop() is reachable."""

    # VICE is running via -autostart.  Program shows title screen and blocks
    # on getch().  Give it a moment then inject SPACE to clear.
    time.sleep(1.0)
    mon.keybuf(PETSCII["SPACE"])
    time.sleep(0.5)

    # Set a breakpoint at the mainmenuloop entry point.
    # After loading the .lbl, the label '.mainmenuloop' (VICE uses the dot
    # prefix) resolves to $5510.  Try the label first; fall back to address.
    bp = mon.set_break(MAINMENULOOP_ADDR)

    # Inject F1 to call mainmenuloop().  VICE is running and will process
    # the keystroke immediately.
    mon.keybuf(PETSCII["F1"])

    addr = mon.wait_for_break(timeout=8)
    assert addr > 0, f"mainmenuloop never reached (break returned addr={addr:#06x})"

    # Clean up: exit the menu with STOP, delete the breakpoint, resume.
    mon.keybuf(PETSCII["STOP"])
    time.sleep(0.2)
    mon.delete_break(bp)
    mon.cont()
    time.sleep(0.5)   # let VICE settle at menu_main() before next test
