from pathlib import Path
import runpy
import sys


def main() -> None:
    """Delegate to the bundled solc-verify-spec.py with the current argv."""
    script = Path(__file__).resolve().parent / "solc-verify-spec.py"
    if not script.exists():
        sys.stderr.write(f"[ERROR] Cannot find solc-verify-spec.py at {script}\n")
        sys.exit(1)
    runpy.run_path(str(script), run_name="__main__")


if __name__ == "__main__":
    main()
