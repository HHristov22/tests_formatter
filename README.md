# Tests formatter

This script is designed to format Python files using various tools such as `isort`, `black`, and `flake8`.

## Installation

#TBD

```bash
git clone
```
## Usage

```bash
./tests_formatter.sh [filename.py]
```
- If a filename is provided, the script will format the specified Python file.
- If no filename is provided, the script will identify the newest Python file in the current directory and format it.

## Formatting Steps

Check file extension: The script verifies that the provided file has a .py extension. If not, it exits with an error.

Sorting imports: 
1. The script uses `isort` to organize and sort imports within the Python file.

2. The script applies the `black` formatter to ensure consistent and readable code, using a maximum line length of 140 characters.

3. The script runs `flake8` to perform a linting check on the Python file, enforcing a maximum line length of 140 characters.

## Examples

Format a specific Python file:

```bash
./tests_formatter.sh filename.py
```

Format the newest Python file in the current directory:

```bash
./tests_formatter.sh
```
