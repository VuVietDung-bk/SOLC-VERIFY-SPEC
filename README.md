# SOLC-VERIFY-SPEC

## Description
SOLC-VERIFY-SPEC is a spec-based verification tool for Ethereum smart contracts. SOLC-VERIFY-SPEC takes smart contracts written in Solidity along with a specification file to automatically fill in smart contracts with SOLC-VERIFY-based annotations, and later discharge verification conditions using modular program analysis and SMT solvers.
For more information about SOLC-VERIFY, visit the [github page](https://github.com/SRI-CSL/solidity) of the verifier.

## How to Use

1. Install dependencies,

- Requires Python 3.10+
- Install Python dependencies: `pip install -r requirements.txt`

2. Build Docker

The Dockerfile of SOLC-VERIFY can be built with the following command:

```shell
docker build -t solc-verify -f docker/Dockerfile.src .
```

3. Running SOLC-VERIFY-SPEC

After successfully building the docker image, SOLC-VERIFY-SPEC can be run by this command:
```shell
python3 solc-verify-spec.py <file_sol>[:contract_name] <file_spec>
```
Example: `python3 solc-verify-spec.py examples/Test2/test2.sol:Example2 examples/Test2/test2.spec`

You can also type `python3 solc-verify-spec.py -h` to print the optional arguments, but we also list them below.
- `h`, `--help`: Show the help message and exit.
- `--grammar <file_lark>`: Path to the .lark grammar to define the specification language.
- `--no-run`: Do not run the solc-verify after generating annotations.

## Important Note
Please note that this tool is under development and has not been finished yet.

# Project progress 
I will update the progress of the project [here](https://docs.google.com/document/d/1yTYbbY1E0_Z1m4hF7S2beyjzZTqIQ_6BC8W1GNmKNWU/edit?usp=sharing). Feel free to check it out.

# Contact
You can contact me through Email or Discord for cooperation.
- Email: dungchuyentoan1@gmail.com
- Discord: hikari_idk