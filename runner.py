import subprocess

def run_sv(out_file: str) -> int:
    cmd = ["./docker/runsv.sh", out_file]
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, check=False)
    except FileNotFoundError:
        proc = subprocess.run(["bash", "./docker/runsv.sh", out_file],
                              capture_output=True, text=True, check=False)
    if proc.stdout:
        print("\033[96mSOLC-VERIFY OUTPUT:\033[0m")
        print(proc.stdout, end="")
    return proc.returncode
