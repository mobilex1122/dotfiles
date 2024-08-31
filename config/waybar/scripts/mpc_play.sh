#!/bin/bash

# Get the output from MPC
output=$(mpc status 2>/dev/null)

# Check if the output contains "[playing]"
if echo "$output" | grep -q "playing"; then
    echo ""
else
    if echo "$output" | grep -q "paused"; then
        echo ""
    else
        echo ""
    fi
fi
