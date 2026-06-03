"""
Project save + load roundtrip test.

Semi-automated: the test captures memory snapshots and verifies byte-equality;
the user performs the menu navigation in the VICE window following popup
instructions that appear above the VICE window.

Timing note:
  The breakpoint() hooks in overlay3.c compile to NOP instructions in the
  overlay code (0xAC00 range) but Oscar64 does NOT emit 'break' entries in
  the .lbl file for overlay-address breakpoints (multiple overlays share the
  same address range, making them ambiguous to VICE).

  Because overlay3 operations do NOT produce a VICE break notification, this
  test uses wait_user_confirm() (blocking popup) to let the user signal when
  each disk operation is complete.

Menu navigation reference:
  File menu is the 2nd header:
    F1 → RIGHT ×1 → RETURN   (open File pulldown)
    Item 1 highlighted = Save screen
    DOWN ×2 → Save project   (choice 23)
    DOWN ×3 → Load project   (choice 24)

  Imp/Export (4th header):
    F1 → RIGHT ×3 → RETURN → DOWN ×2 → RETURN   (Import VDC SEQ)
"""

import time
from vice_monitor import ViceMonitor, PETSCII
from test_ui import show_info

SCREENMAPBASE = 0x5800
SCREEN_BYTES  = 80 * 25 * 2    # screencodes + attribute bytes

DISK_OP_WAIT = 3.0   # extra sleep after user confirms disk operation


def _wait_user_import(mon: ViceMonitor, steps: str) -> None:
    """Read flag, disconnect (VICE keyboard works), block on Enter, reconnect and verify."""
    initial = mon.read_completion_flag()
    mon.disconnect()
    show_info(steps, title="Do in VICE — then press ENTER in this terminal")
    input("  Press ENTER when the operation is complete: ")
    mon.connect()
    new_flag = mon.read_completion_flag()
    assert new_flag != initial, (
        f"Completion flag unchanged ({initial:#04x}) — "
        "did the overlay6 operation complete?"
    )


def test_project_save_reload(mon: ViceMonitor):
    """Save project then reload it — screen map must be byte-identical."""

    # ── Step 1: Import a reference VDC SEQ to populate the canvas ──
    _wait_user_import(mon,
        """\
F1 → RIGHT ×3 → RETURN → DOWN ×2 → RETURN   (Import VDC SEQ)
  — file browser — navigate to VDC-COLORS → RETURN
RETURN ×5   (accept defaults)""")

    before = mon.read_bank1(SCREENMAPBASE, SCREEN_BYTES)
    assert any(b != 0x20 for b in before[:80]), \
        "Reference import produced a blank canvas"
    mon.cont()
    time.sleep(0.5)

    # ── Step 3: Save project (overlay3, no completion flag) ──
    mon.disconnect()        # keyboard works in VICE while terminal blocks
    show_info("""\
F1 → RIGHT ×1 → RETURN → DOWN ×2 → RETURN   (Save project)
  — save dialog — accept device with RETURN
  Type filename:  testprj   then RETURN
  If 'file exists?' appears: RETURN to confirm overwrite
  Wait for the save to complete (status bar message disappears).""",
        title="Save project")
    input("  Press ENTER when save is complete: ")
    mon.connect()
    time.sleep(DISK_OP_WAIT)

    # ── Step 4: Overwrite canvas with a different SEQ ──
    _wait_user_import(mon,
        """\
F1 → RIGHT ×3 → RETURN → DOWN ×2 → RETURN   (Import VDC SEQ)
  File browser: DOWN ×2 → IDI8B-VDC (3rd SEQ file) → RETURN
  Import dialog: RETURN ×5 (accept defaults)""")
    mon.cont()
    time.sleep(0.5)

    # ── Step 5: Reload the saved project (overlay3, no completion flag) ──
    mon.disconnect()
    show_info("""\
F1 → RIGHT ×1 → RETURN → DOWN ×3 → RETURN   (Load project)
  — file browser (shows .proj files only) —
  Navigate to TESTPRJ.PROJ → RETURN
  Wait for the load to complete (canvas redraws).""",
        title="Load project")
    input("  Press ENTER when load is complete: ")
    mon.connect()
    time.sleep(DISK_OP_WAIT)

    # ── Step 6: Capture after-snapshot and compare ──
    after = mon.read_bank1(SCREENMAPBASE, SCREEN_BYTES)

    assert len(before) == len(after), \
        f"Screen map size mismatch: before={len(before)} after={len(after)}"
    diffs = [
        (i, before[i], after[i])
        for i in range(len(before))
        if before[i] != after[i]
    ]
    assert not diffs, (
        f"Project reload produced {len(diffs)} differing byte(s); "
        f"first diff at offset {diffs[0][0]}: "
        f"before=0x{diffs[0][1]:02x} after=0x{diffs[0][2]:02x}"
    )
