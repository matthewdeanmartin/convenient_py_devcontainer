#!/usr/bin/env bash
set -euo pipefail
python -m pip install --no-cache-dir --upgrade pip --quiet
pip install "pipenv" --no-cache-dir --quiet
python --version
pip --version
pipenv --version
python -m pip install --no-cache-dir --user pipx
python -m pipx ensurepath

export PIP_ONLY_BINARY=""
pipx install --pip-args="--no-cache-dir" "black"
pipx install --pip-args="--no-cache-dir" "isort"
pipx install --pip-args="--no-cache-dir" "pyupgrade"
pipx install --pip-args="--no-cache-dir" "vulture"
pipx install --pip-args="--no-cache-dir" "safety"
pipx install --pip-args="--no-cache-dir" "pygount"
pipx install --pip-args="--no-cache-dir" "flake8"
pipx inject flake8 "dlint" "mccabe" "pyflakes" "pep8-naming" \
	"flake8-bugbear" "flake8-assertive" "flake8-builtins" \
	"flake8-comprehensions"
pipx install --pip-args="--no-cache-dir" "mypy"

# pipenv to requirements requires this version of pipenv.
pipx install --pip-args="--no-cache-dir" "pipenv-to-requirements"
pipx inject --pip-args="--no-cache-dir" pipenv-to-requirements "pipenv==2022.9.8"

pipx install --pip-args="--no-cache-dir" "yamllint"
pipx install --pip-args="--no-cache-dir" "openapi-spec-validator"
pipx install --pip-args="--no-cache-dir" "twine"
pipx install --pip-args="--no-cache-dir" "bandit"
pipx install --pip-args="--no-cache-dir" "poetry"
pipx install --pip-args="--no-cache-dir --only-binary=''" "radon"
pipx install --pip-args="--no-cache-dir --only-binary=''" "pylint"
pipx inject pylint --pip-args="--no-cache-dir --only-binary=''" "pylint-django"
pipx install --pip-args="--no-cache-dir" calcure
pipx install --pip-args="--no-cache-dir" ipython
pipx install --pip-args="--no-cache-dir" jtree
pipx install --pip-args="--no-cache-dir" asciinema
pipx install --pip-args="--no-cache-dir" visidata
pipx install --pip-args="--no-cache-dir" xonsh
pipx install --pip-args="--no-cache-dir" httpie

