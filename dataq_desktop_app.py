"""Executable launcher for the DataQ Seat Watcher desktop app."""
from __future__ import annotations

import sys


def main() -> int:
    if "--watcher-cli" in sys.argv:
        sys.argv.remove("--watcher-cli")
        from adsp_popup_ocr_watcher import main as watcher_main

        return watcher_main()

    from adsp_desktop_app import main as desktop_main

    return desktop_main()


if __name__ == "__main__":
    raise SystemExit(main())
