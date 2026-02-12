from pathlib import Path
from setuptools import setup

here = Path(__file__).parent

setup(
    name="solcspec",
    version="0.1.0",
    description="SOLCSPEC command wrapper",
    py_modules=["svspec_cli"],
    entry_points={
        "console_scripts": [
            "svspec=svspec_cli:main",
        ],
    },
    python_requires=">=3.8",
)
