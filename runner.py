import subprocess

def run_sv(out_file: str, extra_args: list[str] | None = None) -> int:
    args = extra_args or []
    cmd = ["./docker/runsv.sh", out_file] + args
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, check=False)
    except FileNotFoundError:
        proc = subprocess.run(["bash", "./docker/runsv.sh", out_file] + args,
                              capture_output=True, text=True, check=False)
    if proc.stdout:
        print("\033[96mSOLC-VERIFY OUTPUT:\033[0m")
        print(proc.stdout, end="")
    return proc.returncode
