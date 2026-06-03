"""
Project save + load roundtrip test.

Semi-automated: the test captures memory snapshots and verifies byte-equality;
the user performs the menu navigation in the VICE window.

This exercises overlay3.c's project I/O code paths.

Timing note:
  The breakpoint() hooks added to overlay3.c compile to NOP instructions in
  the overlay code (0xAC00 range) but Oscar64 does NOT emit 'break' entries in
  the .lbl file for overlay-address breakpoints (multiple overlays overlap at
  the same address range, making them ambiguous to VICE).

  Because overlay3 operations do NOT produce a VICE break notification, this
  test uses time.sleep() to wait for disk operations to complete.  The user
  is told to wait a moment before confirming each step.

Menu navigation reference:
  File menu is the 2nd header (F1, then RIGHT x1 from the home position).
    Item 1: Save screen  (no DOWN needed)
    Item 2: Load screen  (DOWN x1)
    Item 3: Save project (DOWN x2) → choice 23
    Item 4: Load project (DOWN x3) → choice 24
"""

import time
from vice_monitor import ViceMonitor, PETSCII

SCREENMAPBASE = 0x5800
SCREEN_BYTES  = 80 * 25 * 2    # screencodes + attribute bytes

# Allow time for disk I/O through VICE emulation after user confirms.
DISK_OP_WAIT = 3.0


def _wait_user_manual(step_label: str, steps: str):
    """Print manual-action instructions and wait for the user to press Enter."""
    print()
    print(f"  *** MANUAL ACTION REQUIRED — Step: {step_label} ***")
    for line in steps.strip().splitlines():
        print(f"    {line}")
    input("  Press ENTER here when done: ")


def _wait_user_import(mon: ViceMonitor, steps: str, timeout: float = 120) -> int:
    """Instructions + wait for break 5577 (overlay6 import)."""
    print()
    print("  *** MANUAL ACTION REQUIRED ***")
    for line in steps.strip().splitlines():
        print(f"    {line}")
    print(f"  Waiting up to {timeout:.0f}s for break 5577 to confirm completion...")
    return mon.wait_for_break(timeout=timeout)


def test_project_save_reload(mon: ViceMonitor):
    """Save project then reload it — screen map must be byte-identical."""

    # Step 1: Import a reference VDC SEQ to populate the canvas
    addr = _wait_user_import(mon,
        """\
F1 → RIGHT x3 → DOWN x2 → RETURN   (Import VDC SEQ)
Type: vdc-colors  RETURN
RETURN x5  (accept defaults)""")
    assert addr > 0, "Reference import: break 5577 never fired"

    # Step 2: Capture before-snapshot
    before = mon.read_bank1(SCREENMAPBASE, SCREEN_BYTES)
    assert any(b != 0x20 for b in before[:80]), \
        "Reference import produced a blank canvas"
    mon.cont()
    time.sleep(0.5)

    # Step 3: Save project (overlay3 — no break, user confirms + sleep)
    _wait_user_manual("3 of 5 — Save project",
        """\
F1 → RIGHT x1 → DOWN x2 → RETURN   (Save project)
Type: testprj  RETURN
Wait for the save to complete (status bar message disappears).""")
    time.sleep(DISK_OP_WAIT)

    # Step 4: Overwrite canvas with a different SEQ
    addr = _wait_user_import(mon,
        """\
F1 → RIGHT x3 → DOWN x2 → RETURN   (Import VDC SEQ)
Type: idi8b-vdc  RETURN
RETURN x5  (accept defaults)""")
    assert addr > 0, "Canvas overwrite import: break 5577 never fired"
    mon.cont()
    time.sleep(0.5)

    # Step 5: Reload the saved project (overlay3 — no break, user confirms + sleep)
    _wait_user_manual("5 of 5 — Load project",
        """\
F1 → RIGHT x1 → DOWN x3 → RETURN   (Load project)
Type: testprj.proj  RETURN
Wait for the load to complete (canvas redraws).""")
    time.sleep(DISK_OP_WAIT)

    # Step 6: Capture after-snapshot and compare
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
