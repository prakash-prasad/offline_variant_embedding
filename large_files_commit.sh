#!/bin/bash

# Define size threshold (in bytes)
THRESHOLD=10485760  # 10 MB

# Find and track large files
find . -type f -size +10M | while read -r file; do
    git lfs track "$file"
done

# Add the .gitattributes file to the repository
git add .gitattributes

# Optionally, you can add and commit large files
find . -type f -size +10M | while read -r file; do
    git add "$file"
done

# Commit changes
git commit -m "Track large files with Git LFS"
