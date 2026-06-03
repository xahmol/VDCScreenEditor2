"""
Tests for SEQ import (VDC and C64 modes).

Semi-automated: the test sets breakpoints and verifies memory; the user
performs the menu navigation in the VICE window.

Background:
  Oscar64 inlines the thin overlay6 wrapper functions into mainmenuloop's
  switch cases.  All four overlay6 cases (42-45) share a NOP at $5577.
  Loading the .lbl file auto-activates 'break 5577'.  The test waits for
  that break to confirm the operation completed, then reads the screen map.

Menu navigation reference (for the operator):
  Imp/Export is the 4th header (F1, then RIGHT x3 from the home position).
  Items (DOWN count from the top of the pulldown):
    0 DOWNs → Import PRG      (choice 41, overlay5)
    1 DOWN  → Import C64 SEQ  (choice 42, overlay6)
    2 DOWNs → Import VDC SEQ  (choice 43, overlay6)
    3 DOWNs → Export C64 SEQ  (choice 44, overlay6)
    4 DOWNs → Export VDC SEQ  (choice 45, overlay6)

Import dialogue prompts (accept all defaults with RETURN):
  1. File picker  → type filename + RETURN
  2. Import width → RETURN (default 80)
  3. Import height → RETURN (default 25)
  4. Target X     → RETURN (default 0)
  5. Target Y     → RETURN (default 0)
  6. cls?         → RETURN (No / first item in pulldown)
  [C64 SEQ only: 7. convert? → RETURN; 8. uppercase? → RETURN]

SCREENMAPBASE = 0x5800 in Bank 1.
"""

import time
from vice_monitor import ViceMonitor, PETSCII

SCREENMAPBASE = 0x5800
SCREEN_WIDTH  = 80


def _wait_user_import(mon: ViceMonitor, steps: str, timeout: float = 120) -> int:
    """
    Print operator instructions and wait for break 5577 to confirm the import.
    Returns the break address, or raises ViceMonitorError on timeout.
    """
    print()
    print("  *** MANUAL ACTION REQUIRED ***")
    print(f"  In the VICE window, do the following:")
    for line in steps.strip().splitlines():
        print(f"    {line}")
    print(f"  Waiting up to {timeout:.0f}s for break 5577 to confirm completion...")
    addr = mon.wait_for_break(timeout=timeout)
    return addr


def test_seq_import_vdc(mon: ViceMonitor):
    """
    Import vdc_color-bars_test.seq (VDC mode) and verify the screen map
    is populated (first row is not all spaces).
    Disk filename: 'vdc-colors'.
    """
    steps = """\
F1  (open main menu bar)
RIGHT x3  (reach Imp/Export — 4th header)
DOWN x2   (reach 'Import VDC SEQ' — 3rd item)
RETURN    (select Import VDC SEQ)
Type: vdc-colors  then RETURN  (filename)
RETURN x5  (accept width / height / X / Y / cls defaults)"""

    addr = _wait_user_import(mon, steps)
    assert addr > 0, f"break 5577 (import_seq_vdc_complete) never fired (addr={addr:#06x})"

    row0 = mon.read_bank1(SCREENMAPBASE, SCREEN_WIDTH)
    assert len(row0) == SCREEN_WIDTH, \
        f"Expected {SCREEN_WIDTH} bytes from Bank1, got {len(row0)}"
    assert any(b != 0x20 for b in row0), \
        "Screen map first row is all spaces — VDC SEQ import did not populate canvas"

    mon.cont()
    time.sleep(0.5)


def test_seq_import_c64(mon: ViceMonitor):
    """
    Import vic-uc_color-bars_test.seq (C64 uppercase mode) and verify the
    screen map is populated.
    Disk filename: 'vicuc-colors'.
    """
    steps = """\
F1  (open main menu bar)
RIGHT x3  (reach Imp/Export)
DOWN x1   (reach 'Import C64 SEQ' — 2nd item)
RETURN    (select Import C64 SEQ)
Type: vicuc-colors  then RETURN  (filename)
RETURN x7  (accept width / height / X / Y / cls / convert / uppercase defaults)"""

    addr = _wait_user_import(mon, steps)
    assert addr > 0, f"break 5577 (import_seq_c64_complete) never fired (addr={addr:#06x})"

    row0 = mon.read_bank1(SCREENMAPBASE, SCREEN_WIDTH)
    assert len(row0) == SCREEN_WIDTH, \
        f"Expected {SCREEN_WIDTH} bytes from Bank1, got {len(row0)}"
    assert any(b != 0x20 for b in row0), \
        "Screen map first row is all spaces — C64 SEQ import did not populate canvas"

    mon.cont()
    time.sleep(0.5)
