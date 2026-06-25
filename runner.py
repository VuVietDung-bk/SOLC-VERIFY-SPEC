import subprocess
from pathlib import Path

def run_sv(out_file: str, extra_args: list[str] | None = None, verbose: bool = False) -> int:
    args = extra_args or []
    repo_root = Path(__file__).resolve().parent
    script = repo_root / "docker" / "runsv.sh"
    cmd = [str(script), out_file] + args
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, check=False)
    except FileNotFoundError:
        proc = subprocess.run(["bash", str(script), out_file] + args,
                              capture_output=True, text=True, check=False)
    if proc.stdout:
        if verbose:
            print("\033[96mSOLC-VERIFY OUTPUT:\033[0m")
            print(proc.stdout, end="")
        else:
            import re
            failed_funcs = []
            generic_errors = []
            generic_warnings = []
            
            ansi_escape = re.compile(r'\x1B(?:[@-Z\\-_]|\[[0-?]*[ -/]*[@-~])')
            
            lines = proc.stdout.splitlines()
            for i, line in enumerate(lines):
                clean_line = ansi_escape.sub('', line).strip()
                if clean_line.endswith(": ERROR"):
                    func_name = clean_line[:-7].strip()
                    reason = ""
                    if i + 1 < len(lines):
                        next_clean = ansi_escape.sub('', lines[i+1]).strip()
                        if next_clean.startswith("-"):
                            m = re.match(r'^-\s+[^:]+:\d+:\d+:\s+(.*)$', next_clean)
                            if m:
                                reason = m.group(1)
                            else:
                                reason = next_clean
                    failed_funcs.append((func_name, reason))
                elif not clean_line.endswith(": OK") and not clean_line.endswith(": ERROR"):
                    if "error:" in clean_line.lower() or "[error]" in clean_line.lower() or "exception" in clean_line.lower():
                        generic_errors.append(clean_line)
                    elif "warning:" in clean_line.lower() or "[warning]" in clean_line.lower():
                        generic_warnings.append(clean_line)

            if failed_funcs:
                print(f"  \033[91m[FAILED]\033[0m {len(failed_funcs)} function(s) failed verification:")
                for func_name, reason in failed_funcs:
                    if reason:
                        if len(reason) > 120:
                            reason = reason[:117] + "..."
                        print(f"    - \033[93m{func_name}\033[0m: {reason}")
                    else:
                        print(f"    - \033[93m{func_name}\033[0m")
            elif generic_errors:
                print(f"  \033[91m[ERROR]\033[0m Verification failed with errors:")
                for err in generic_errors[:3]:
                    print(f"    {err}")
                if len(generic_errors) > 3:
                    print(f"    ... and {len(generic_errors)-3} more.")
            else:
                oks = [ansi_escape.sub('', l).strip() for l in lines if ansi_escape.sub('', l).strip().endswith(": OK")]
                if oks:
                    print(f"  \033[92m[PASS]\033[0m All {len(oks)} function(s) verified successfully.")
                else:
                    print(f"  \033[96m[SUMMARY]\033[0m Process completed (use --verbose for details).")
            
            if generic_warnings:
                print(f"  \033[93m[WARNING]\033[0m Found {len(generic_warnings)} warning(s) (use --verbose to view).")
    return proc.returncode
