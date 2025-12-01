#!/bin/bash

# Create a demo repository
mkdir git-demo && cd git-demo
git init
git checkout -b main

# Create initial file
echo "Line 1: Original content" > demo.txt
echo "Line 2: Original content" >> demo.txt
echo "Line 3: Original content" >> demo.txt
git add demo.txt
git commit -m "Initial commit"

# Create branch A
git checkout -b feature-a
echo "Line 1: Changed by Feature A" > demo.txt
echo "Line 2: Original content" >> demo.txt
echo "Line 3: Changed by Feature A" >> demo.txt
git add demo.txt
git commit -m "Feature A changes"

# Go back and create branch B from main
git checkout main
git checkout -b feature-b
echo "Line 1: Changed by Feature B" > demo.txt
echo "Line 2: Original content" >> demo.txt
echo "Line 3: Changed by Feature B" >> demo.txt
git add demo.txt
git commit -m "Feature B changes"

# Merge feature-a into main first
git checkout main
# git merge feature-a

# Now try to rebase feature-b onto main - CONFLICT!
# git checkout feature-b
# git rebase main
# This will create a conflict on lines 1 and 3

