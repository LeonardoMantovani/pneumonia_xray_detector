#!/bin/bash

# ============================================================
# This is a bash script that can be used to quickly set up
# the development environment of this project after cloning it.
# It will download the used dataset from Kaggle, create a new
# python virtual environment and install the required packages.
# ============================================================

DATASET_URL="https://www.kaggle.com/api/v1/datasets/download/paultimothymooney/chest-xray-pneumonia"
DATA_DIR="data"
PRETTY_PRINT=$'\n\e[33m%s\e[0m\n'

# Download the Kaggle dataset
printf "$PRETTY_PRINT" "Downloading dataset from Kaggle..."
mkdir -p "$DATA_DIR"
curl -L -o "$DATA_DIR/chest_xray.zip" "$DATASET_URL"
printf "$PRETTY_PRINT" "Dataset download completed."

# Extract it in the current directory
printf "$PRETTY_PRINT" "Extracting the dataset..."
unzip "$DATA_DIR/chest_xray.zip" -d "$DATA_DIR"
rm "$DATA_DIR/chest_xray.zip"
rm -rf "$DATA_DIR/chest_xray/__MACOSX"
rm -rf "$DATA_DIR/chest_xray/chest_xray"
printf "$PRETTY_PRINT" "Dataset extraction completed."

# Create a new python virtual environment
printf "$PRETTY_PRINT" "Creating a new python virtual environment..."
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade pip
printf "$PRETTY_PRINT" "Virtual environment creation completed."

# Install the required packages
printf "$PRETTY_PRINT" "Installing required packages..."
python3 -m pip install -r requirements.txt
printf "$PRETTY_PRINT" "Packages installation completed."