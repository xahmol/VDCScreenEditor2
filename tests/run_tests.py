#!/usr/bin/env python3
"""
Automated test runner for VDC Screen Editor 2.

Launches x128, connects to the VICE remote monitor, runs all test modules,
and reports pass/fail.  Intended to be called by 'make test'.

Usage:
    python3 tests/run_tests.py --image build/vdcse_test.d81 --symbols build/vdcse_test.lbl

Environment:
    VICE_MONITOR_PORT   Override remote monitor port (default: 6510)
    VICE_BOOT_WAIT      Seconds to wait for VICE to boot (default: 4)
    VICE_CMD            Path to x128 binary (default: x128)
"""

import argparse
import os
import subprocess
import sys
import time

# Make sure tests/ is on the path when run from the project root
sys.path.insert(0, os.path.dirname(__file__))

from vice_monitor import ViceMonitor, ViceMonitorError, DEFAULT_PORT

# ---------------------------------------------------------------------------
# Test imports — each module exposes one or more test_* functions
# ---------------------------------------------------------------------------
from test_startup       import test_startup
from test_seq_import    import test_seq_import_vdc, test_seq_import_c64
from test_seq_roundtrip import test_seq_export_reimport_roundtrip
from test_project       import test_project_save_reload

ALL_TESTS = [
    test_startup,
    test_seq_import_vdc,
    test_seq_import_c64,
    test_seq_export_reimport_roundtrip,
    test_project_save_reload,
]


def launch_vice(image: str, port: int) -> subprocess.Popen:
    """Launch x128 with remote monitor, loading symbols via -moncommands.

    Uses -initbreak reset + -moncommands (same as make vice-debug) instead of
    -autostart.  This avoids a WSL2/WSLg issue where -autostart combined with
    an active remote-monitor TCP connection blocks X11 keyboard delivery to
    the VICE window.

    setup.mon loads the symbol file (activating break 5577) and then sends 'g'
    to start the C128 boot sequence from the disk image.  Python connects
    after a short wait and enables warp mode to speed up disk loading.
    """
    vice_cmd = os.environ.get("VICE_CMD", "x128")
    args = [
        vice_cmd,
        "-remotemonitor",
        "-remotemonitoraddress", f"127.0.0.1:{port}",
        "-monlogname", "build/monitor_test.log",
        "-monlog",
        "-keepmonopen",
        # Break at reset so -moncommands runs before the CPU starts.
        "-initbreak", "reset",
        # setup.mon loads the symbol file (ll) and resumes (g).
        # Symbols include 'break 5577' which VICE auto-activates.
        "-moncommands", "tests/setup.mon",
        image,
    ]
    print(f"Launching: {' '.join(args)}")
    # Redirect VICE's own stdout/stderr to a log file so they don't pollute
    # the test output.  Python's print() still goes to the terminal.
    with open("build/vice_launch.log", "w") as vice_log:
        return subprocess.Popen(args, stdout=vice_log, stderr=vice_log)


def run_all(image: str, symbols: str, port: int) -> bool:
    """Launch VICE, run all tests, return True if all passed."""
    proc = launch_vice(image, port)

    # Allow VICE time to start the emulator and open the remote monitor socket,
    # but we don't need to wait for vdcse to finish loading — warp mode below
    # handles that.  3 seconds is enough for VICE itself to start.
    vice_init_wait = float(os.environ.get("VICE_BOOT_WAIT", "3"))
    print(f"Waiting {vice_init_wait}s for VICE to initialize...")
    time.sleep(vice_init_wait)

    mon = ViceMonitor()
    all_passed = True
    results = []

    try:
        mon.connect(port=port)

        # Enable warp mode so the 1581 disk loads vdcse in seconds instead
        # of ~30s real-time.  Warp is disabled again before the tests run.
        print("Enabling warp mode for fast disk load...")
        mon.warp(True)
        warp_wait = float(os.environ.get("VICE_WARP_WAIT", "6"))
        time.sleep(warp_wait)
        mon.warp(False)
        print("Warp mode off — vdcse should be at the title screen now.")
        time.sleep(1.0)   # let the last few frames render at normal speed

        # Symbols (including 'break 5577') were loaded by setup.mon at
        # VICE startup.  No need to load them again here.
        print("Symbols loaded by setup.mon at startup (break 5577 active).")

        for test_fn in ALL_TESTS:
            name = test_fn.__name__
            print(f"\n{'='*60}")
            print(f"  Running: {name}")
            print(f"{'='*60}")
            try:
                test_fn(mon)
                results.append((name, "PASS", None))
                print(f"  PASS: {name}")
            except AssertionError as exc:
                results.append((name, "FAIL", str(exc)))
                print(f"  FAIL: {name}: {exc}")
                all_passed = False
            except ViceMonitorError as exc:
                results.append((name, "ERROR", str(exc)))
                print(f"  ERROR: {name}: {exc}")
                all_passed = False
            except Exception as exc:
                results.append((name, "ERROR", str(exc)))
                print(f"  ERROR (unexpected): {name}: {exc}")
                all_passed = False

    except ViceMonitorError as exc:
        print(f"\nFATAL: Could not connect to VICE monitor: {exc}")
        all_passed = False
    finally:
        mon.disconnect()
        proc.terminate()
        try:
            proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            proc.kill()

    # Summary
    print(f"\n{'='*60}")
    print("  RESULTS")
    print(f"{'='*60}")
    for name, status, msg in results:
        line = f"  {status:5s}  {name}"
        if msg:
            line += f"  — {msg}"
        print(line)
    total   = len(results)
    passed  = sum(1 for _, s, _ in results if s == "PASS")
    failed  = total - passed
    print(f"\n  {passed}/{total} passed", end="")
    if failed:
        print(f"  ({failed} failed)")
    else:
        print()

    return all_passed


def main():
    parser = argparse.ArgumentParser(description="VDC Screen Editor 2 automated tests")
    parser.add_argument("--image",   required=True, help="Test disk image (.d81)")
    parser.add_argument("--symbols", default="",    help="VICE label file (.lbl)")
    parser.add_argument("--port",    type=int, default=DEFAULT_PORT,
                        help=f"Remote monitor port (default: {DEFAULT_PORT})")
    args = parser.parse_args()

    if not os.path.exists(args.image):
        print(f"ERROR: disk image not found: {args.image}")
        sys.exit(1)

    ok = run_all(args.image, args.symbols, args.port)
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
