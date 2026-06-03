"""
SEQ export + reimport roundtrip test.

Semi-automated: the test captures memory snapshots and verifies byte-equality;
the user performs the menu navigation in the VICE window for each step.

Steps:
  1. User imports 'vdc-colors' (VDC SEQ) — break 5577 confirms.
  2. Test captures screen map (Bank 1, SCREENMAPBASE, 80x25x2 bytes).
  3. User exports the canvas as VDC SEQ to file 'testrt' — break 5577 confirms.
  4. User reimports 'testrt' (VDC SEQ) — break 5577 confirms.
  5. Test captures screen map again.
  6. Assert byte-identical.

Break 5577 fires for all four overlay6 menu operations (choices 42-45).
The test controls which operation completed by tracking the step sequence.
"""

import time
from vice_monitor import ViceMonitor, PETSCII

SCREENMAPBASE = 0x5800
SCREEN_BYTES  = 80 * 25 * 2    # screencodes + attribute bytes for 80x25


def _wait_user(mon: ViceMonitor, step_label: str, steps: str, timeout: float = 120) -> int:
    """Print operator instructions and wait for break 5577."""
    print()
    print(f"  *** MANUAL ACTION REQUIRED — Step: {step_label} ***")
    for line in steps.strip().splitlines():
        print(f"    {line}")
    print(f"  Waiting up to {timeout:.0f}s for break 5577...")
    return mon.wait_for_break(timeout=timeout)


def test_seq_export_reimport_roundtrip(mon: ViceMonitor):
    """Export + reimport VDC SEQ produces byte-identical screen map data."""

    # Step 1: Import reference
    addr = _wait_user(mon, "1 of 3 — Import",
        """\
F1 → RIGHT x3 → DOWN x2 → RETURN   (select Import VDC SEQ)
Type: vdc-colors  RETURN
RETURN x5  (accept width / height / X / Y / cls defaults)""")
    assert addr > 0, "Step 1 (import): break 5577 never fired"

    # Step 2: Capture before-snapshot
    before = mon.read_bank1(SCREENMAPBASE, SCREEN_BYTES)
    assert any(b != 0x20 for b in before[:80]), \
        "Reference import produced a blank canvas — cannot run roundtrip test"
    mon.cont()
    time.sleep(0.5)

    # Step 3: Export
    addr = _wait_user(mon, "2 of 3 — Export",
        """\
F1 → RIGHT x3 → DOWN x4 → RETURN   (select Export VDC SEQ)
Type: testrt  RETURN
RETURN  (accept default)""")
    assert addr > 0, "Step 3 (export): break 5577 never fired"
    mon.cont()
    time.sleep(0.5)

    # Step 4: Reimport
    addr = _wait_user(mon, "3 of 3 — Reimport",
        """\
F1 → RIGHT x3 → DOWN x2 → RETURN   (select Import VDC SEQ)
Type: testrt  RETURN
RETURN x5  (accept width / height / X / Y / cls defaults)""")
    assert addr > 0, "Step 4 (reimport): break 5577 never fired"

    # Step 5: Capture after-snapshot
    after = mon.read_bank1(SCREENMAPBASE, SCREEN_BYTES)
    mon.cont()
    time.sleep(0.5)

    # Step 6: Compare
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
