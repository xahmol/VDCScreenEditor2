"""
SEQ export + reimport roundtrip test.

Semi-automated: the test captures memory snapshots and verifies byte-equality;
the user performs the menu navigation in the VICE window following popup
instructions that appear above the VICE window.

Steps:
  1. User imports 'vdc-colors' (VDC SEQ) — break 5577 confirms.
  2. Test captures screen map (Bank 1, SCREENMAPBASE, 80×25×2 bytes).
  3. User exports the canvas as VDC SEQ to file 'testrt' — break 5577 confirms.
  4. User reimports 'testrt' (VDC SEQ) — break 5577 confirms.
  5. Test captures screen map again.
  6. Assert byte-identical.

Menu navigation — see test_seq_import.py for full reference.
Export VDC SEQ: Imp/Export pulldown → RETURN (open) → DOWN ×4 → RETURN.

Break 5577 fires for all four overlay6 operations (choices 42-45).
"""

import time
from vice_monitor import ViceMonitor, PETSCII
from test_ui import show_info

SCREENMAPBASE = 0x5800
SCREEN_BYTES  = 80 * 25 * 2    # screencodes + attribute bytes for 80×25


def _wait_user(mon: ViceMonitor, step_label: str, steps: str) -> None:
    """Read flag, disconnect (VICE keyboard works), block on Enter, reconnect and verify."""
    initial = mon.read_completion_flag()
    mon.disconnect()
    show_info(steps, title=f"Step {step_label} — Do in VICE, then press ENTER here")
    input("  Press ENTER when the operation is complete: ")
    mon.connect()
    new_flag = mon.read_completion_flag()
    assert new_flag != initial, (
        f"Completion flag unchanged ({initial:#04x}) — "
        "did the overlay6 operation complete?"
    )


def test_seq_export_reimport_roundtrip(mon: ViceMonitor):
    """Export + reimport VDC SEQ produces byte-identical screen map data."""

    # ── Step 1: Import reference ──
    _wait_user(mon, "1 of 3 — Import vdc-colors",
        """\
F1 → RIGHT ×3 → RETURN → DOWN ×2 → RETURN   (Import VDC SEQ)
  — file browser — navigate to VDC-COLORS → RETURN
RETURN ×5   (accept width / height / X / Y / cls defaults)""")

    before = mon.read_bank1(SCREENMAPBASE, SCREEN_BYTES)
    assert any(b != 0x20 for b in before[:80]), \
        "Reference import produced a blank canvas — cannot run roundtrip test"
    mon.cont()
    time.sleep(0.5)

    # ── Step 3: Export ──
    _wait_user(mon, "2 of 3 — Export as testrt",
        """\
F1 → RIGHT ×3 → RETURN → DOWN ×4 → RETURN   (Export VDC SEQ)
  — save dialog — accept device with RETURN
  Type filename:  testrt   then RETURN
  If 'file exists?' appears: RETURN to confirm overwrite""")
    mon.cont()
    time.sleep(0.5)

    # ── Step 4: Reimport ──
    _wait_user(mon, "3 of 3 — Reimport testrt",
        """\
F1 → RIGHT ×3 → RETURN → DOWN ×2 → RETURN   (Import VDC SEQ)
  — file browser — navigate to TESTRT → RETURN
RETURN ×5   (accept width / height / X / Y / cls defaults)""")

    after = mon.read_bank1(SCREENMAPBASE, SCREEN_BYTES)
    mon.cont()
    time.sleep(0.5)

    # ── Step 6: Compare ──
    assert len(before) == len(after), \
        f"Screen map size mismatch: before={len(before)} after={len(after)}"
    diffs = [
        (i, before[i], after[i])
        for i in range(len(before))
        if before[i] != after[i]
    ]
    assert not diffs, (
        f"Roundtrip produced {len(diffs)} differing byte(s); "
        f"first diff at offset {diffs[0][0]}: "
        f"before=0x{diffs[0][1]:02x} after=0x{diffs[0][2]:02x}"
    )
