#!/bin/bash

# Function to check if the output is correct
check_output() {
    local output=$1
    local expected=$2
    if [ "$output" -ne "$expected" ]; then
        echo "Test failed: expected $expected, got $output" >&2
        exit 1
    fi
}

# Test cases
output=$(./gcd.sh 2 4)
check_output "$output" 2

output=$(./gcd.sh 12 15)
check_output "$output" 3

output=$(./gcd.sh 7 13)
check_output "$output" 1

# Check for incorrect input
if ./gcd.sh 3; then
    echo "Test failed: single argument did not fail as expected" >&2
    exit 1
fi

if ./gcd.sh 3 abc; then
    echo "Test failed: non-numeric argument did not fail as expected" >&2
    exit 1
fi

echo "All tests passed."
