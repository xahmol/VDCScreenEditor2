"""
Tests for SEQ import (VDC and C64 modes).

Semi-automated: the test sets the VICE breakpoint and verifies memory; the
user performs the menu navigation in the VICE window following the popup
instructions that appear above the VICE window.

Background:
  Oscar64 inlines the overlay6 wrapper functions into mainmenuloop's switch
  cases.  All four overlay6 cases (42-45) share a NOP at $5577.  Loading the
  .lbl file auto-activates 'break 5577'.  The test waits for that break to
  confirm the operation completed, then reads the screen map.

Menu navigation reference:
  Imp/Export is the 4th header:
    F1  → menu bar opens (header 1 highlighted)
    RIGHT ×3  → navigate to Imp/Export header
    RETURN  → open Imp/Export pulldown (item 1 highlighted)
    DOWN ×N  → navigate within pulldown (see items below)
    RETURN  → select

  NOTE: the menu bar only responds to LEFT / RIGHT / RETURN / ESC / STOP.
  DOWN is silently ignored there; use RETURN to open the pulldown first.

  Imp/Export pulldown items (item 1 already highlighted after RETURN):
    0 extra DOWNs → Import PRG       (choice 41)
    1 DOWN        → Import C64 SEQ   (choice 42)
    2 DOWNs       → Import VDC SEQ   (choice 43)
    3 DOWNs       → Export C64 SEQ   (choice 44)
    4 DOWNs       → Export VDC SEQ   (choice 45)

Import dialogue prompts (accept defaults with RETURN):
  VDC SEQ (5): width, height, X, Y, cls
  C64 SEQ (7): width, height, X, Y, cls, convert, uppercase

SCREENMAPBASE = 0x5800 in Bank 1.
"""

import time
from vice_monitor import ViceMonitor, PETSCII
from test_ui import show_info

SCREENMAPBASE = 0x5800
SCREEN_WIDTH  = 80


def _wait_user_import(mon: ViceMonitor, steps: str, timeout: float = 120) -> int:
    """
    Show instructions, disconnect from VICE monitor (so WSL2 keyboard works),
    then poll until break 5577 fires.  Returns the break address.
    """
    show_info(steps, title="Do in VICE — then wait for test to continue")
    print(f"  Waiting up to {timeout:.0f}s for break 5577 …")
    addr = mon.wait_for_break_interactive(timeout=timeout)
    return addr


def test_seq_import_vdc(mon: ViceMonitor):
    """
    Import vdc_color-bars_test.seq (VDC mode) and verify the screen map
    is populated (first row is not all spaces).
    Disk filename: 'vdc-colors'.
    """
    steps = """\
F1                    open main menu bar
RIGHT ×3              navigate to Imp/Export (4th header)
RETURN                open Imp/Export pulldown
DOWN ×2               reach Import VDC SEQ (3rd item)
RETURN                select Import VDC SEQ
  — file browser opens —
Navigate to 'VDC-COLORS' and press RETURN to select
  — import dialog —
RETURN ×5             accept width / height / X / Y / cls defaults"""

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
F1                    open main menu bar
RIGHT ×3              navigate to Imp/Export (4th header)
RETURN                open Imp/Export pulldown
DOWN ×1               reach Import C64 SEQ (2nd item)
RETURN                select Import C64 SEQ
  — file browser opens —
Navigate to 'VICUC-COLORS' and press RETURN to select
  — import dialog —
RETURN ×7             accept width / height / X / Y / cls / convert / uppercase defaults"""

    addr = _wait_user_import(mon, steps)
    assert addr > 0, f"break 5577 (import_seq_c64_complete) never fired (addr={addr:#06x})"

    row0 = mon.read_bank1(SCREENMAPBASE, SCREEN_WIDTH)
    assert len(row0) == SCREEN_WIDTH, \
        f"Expected {SCREEN_WIDTH} bytes from Bank1, got {len(row0)}"
    assert any(b != 0x20 for b in row0), \
        "Screen map first row is all spaces — C64 SEQ import did not populate canvas"

    mon.cont()
    time.sleep(0.5)
