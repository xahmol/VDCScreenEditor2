"""
Test UI helpers for semi-automated tests.

Instructions are printed to the terminal.  Before running tests, snap VICE
and Windows Terminal side by side (Win+Left / Win+Right) so both windows are
visible at the same time — no alt-tabbing needed.

  show_info(steps)         — print instructions; test immediately continues to
                             wait_for_break().  User operates VICE while the
                             test waits for break 5577.

  wait_user_confirm(steps) — print instructions; block until user presses
                             ENTER in the terminal.  Used for overlay3
                             operations that produce no VICE break signal.
"""

import sys


def show_info(steps: str, title: str = "Do in VICE:"):
    """Print step instructions to the terminal (non-blocking)."""
    _print_steps(steps, title)


def wait_user_confirm(steps: str, title: str = "Action required:"):
    """Print instructions and block until the user presses ENTER."""
    _print_steps(steps, title)
    input("  Press ENTER here when the operation is complete: ")


def _print_steps(steps: str, title: str):
    sep = "─" * 60
    print()
    print(f"  {sep}")
    print(f"  {title}")
    print(f"  {sep}")
    for line in steps.strip().splitlines():
        print(f"    {line}")
    print(f"  {sep}")
    # Ring the terminal bell so the user notices
    print("\a", end="", flush=True)
