#!/usr/bin/env bash
# This script adds the required dependencies to the project using pdm
# Usage: ./setup.sh 
# SAVE_EXACT=1 ./setup.sh # To save exact versions of the dependencies

PDM_OPTIONS=""
if [[ $SAVE_EXACT -eq 1 ]]; then
    PDM_OPTIONS="${PDM_OPTIONS} --save-exact"
fi

echo -e "\033[1;32m[INFO]\033[0m Setting up the project..."
# Add the required dependencies
pdm add $PDM_OPTIONS fastapi uvicorn environs 
pdm add $PDM_OPTIONS -d pre-commit

read -p "Do you want to add support for a database? [y/N] " db_support
if [[ $db_support =~ ^[Yy]$ ]]; then
    pdm add $PDM_OPTIONS -G db sqlalchemy pymysql
else
    echo -e "\033[1;33m[WARNING]\033[0m Skipping database support..."
fi

read -p "Do you want to add support for testing? [y/N] " test_support
if [[ $test_support =~ ^[Yy]$ ]]; then
    pdm add $PDM_OPTIONS -G test pytest pytest-asyncio coverage
else
    echo -e "\033[1;33m[WARNING]\033[0m Skipping testing support..."
fi

read -p "Do you want to add support for linting? [y/N] " lint_support
if [[ $lint_support =~ ^[Yy]$ ]]; then
    pdm add $PDM_OPTIONS -G lint ruff
else
    echo -e "\033[1;33m[WARNING]\033[0m Skipping linting support..."
fi

read -p "Do you want to add support for jupyter notebooks? [y/N] " notebook_support
if [[ $notebook_support =~ ^[Yy]$ ]]; then
    pdm add $PDM_OPTIONS -G notebook jupyter
else
    echo -e "\033[1;33m[WARNING]\033[0m Skipping jupyter notebook support..."
fi
