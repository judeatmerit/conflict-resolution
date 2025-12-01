#!/bin/bash

# Create a function that both branches modify
cat > calculator.js << 'EOF'
function calculate(a, b) {
    return a + b;
}

module.exports = calculate;
EOF

git add calculator.js
git commit -m "Add calculator function"

# Branch 1: Add multiplication
git checkout -b add-multiply
cat > calculator.js << 'EOF'
function calculate(a, b, operation) {
    if (operation === 'multiply') {
        return a * b;
    }
    return a + b;
}

module.exports = calculate;
EOF
git add calculator.js
git commit -m "Add multiplication support"

# Branch 2: Add subtraction
git checkout main
git checkout -b add-subtract
cat > calculator.js << 'EOF'
function calculate(a, b, operation) {
    if (operation === 'subtract') {
        return a - b;
    }
    return a + b;
}

module.exports = calculate;
EOF
git add calculator.js
git commit -m "Add subtraction support"

# Merge first branch
git checkout main
# git merge add-multiply

# Create conflict with second branch
git checkout add-subtract
# git rebase main
# Conflict: both modified the operation check
