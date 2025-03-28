#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Define the URL and destination folder
URL="https://github.com/FortAwesome/Font-Awesome/releases/download/6.7.2/fontawesome-free-6.7.2-web.zip"
TMP_DIR="/tmp/fontawesome_$(date +%s)"
DEST_DIR="./_extensions/quarto-fa/assets"

# Create the necessary directories
mkdir -p "$TMP_DIR" "$DEST_DIR"

# Download the ZIP file
ZIP_FILE="$TMP_DIR/fontawesome.zip"
echo "Downloading Font Awesome..."
curl -L --fail --silent --show-error "$URL" -o "$ZIP_FILE"

# Extract the ZIP file
echo "Extracting files..."
unzip -q "$ZIP_FILE" -d "$TMP_DIR"

# Remove the ZIP file after extraction
rm "$ZIP_FILE"

# Locate the extracted directory (it contains a single subdirectory)
EXTRACTED_DIR=$(find "$TMP_DIR" -mindepth 1 -maxdepth 1 -type d)

# Copy required files
echo "Copying files..."
cp "$EXTRACTED_DIR/js/all.min.js" "$DEST_DIR"

# Print the extraction path
echo "Font Awesome extracted to: $EXTRACTED_DIR"
echo "Files copied to: $DEST_DIR"
