from pathlib import Path
from setuptools import setup

here = Path(__file__).parent

setup(
    name="solc-verify-spec",
    version="0.1.0",
    description="SOLC-VERIFY-SPEC command wrapper",
    py_modules=["svspec_cli"],
    entry_points={
        "console_scripts": [
            "svspec=svspec_cli:main",
        ],
    },
    python_requires=">=3.8",
)
