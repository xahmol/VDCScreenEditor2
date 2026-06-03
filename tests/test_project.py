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
from test_ui import show_info, wait_user_confirm

SCREENMAPBASE = 0x5800
SCREEN_BYTES  = 80 * 25 * 2    # screencodes + attribute bytes

DISK_OP_WAIT = 3.0   # extra sleep after user confirms disk operation


def _wait_user_import(mon: ViceMonitor, steps: str, timeout: float = 120) -> None:
    """Read flag, show instructions, disconnect and poll until flag changes."""
    initial = mon.read_completion_flag()
    show_info(steps, title="Do in VICE — then wait for test to continue")
    print(f"  Waiting up to {timeout:.0f}s for completion flag …")
    mon.wait_completion_flag(initial, timeout=timeout)


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

    # ── Step 3: Save project ──
    wait_user_confirm(
        """\
F1 → RIGHT ×1 → RETURN → DOWN ×2 → RETURN   (Save project)
  — save dialog — accept device with RETURN
  Type filename:  testprj   then RETURN
  If 'file exists?' appears: RETURN to confirm overwrite
  Wait for the save to complete (status bar message disappears).""",
        title="Save project — click OK when save is complete")
    time.sleep(DISK_OP_WAIT)

    # ── Step 4: Overwrite canvas with a different SEQ ──
    _wait_user_import(mon,
        """\
F1 → RIGHT ×3 → RETURN → DOWN ×2 → RETURN   (Import VDC SEQ)
  — file browser — navigate to IDI8B-VDC → RETURN
RETURN ×5   (accept defaults)""")
    mon.cont()
    time.sleep(0.5)

    # ── Step 5: Reload the saved project ──
    wait_user_confirm(
        """\
F1 → RIGHT ×1 → RETURN → DOWN ×3 → RETURN   (Load project)
  — file browser (shows .proj files only) —
  Navigate to TESTPRJ.PROJ → RETURN
  Wait for the load to complete (canvas redraws).""",
        title="Load project — click OK when load is complete")
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
