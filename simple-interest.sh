#!/bin/bash

# ------------------------------------------------------------
# Simple Interest Calculator
# ------------------------------------------------------------
# Formula:
#   Simple Interest (SI) = (Principal * Rate * Time) / 100
#   Total Amount         = Principal + SI
# ------------------------------------------------------------

echo "===== Simple Interest Calculator ====="

# Prompt user for input
read -p "Enter Principal Amount: " principal
read -p "Enter Rate of Interest (%): " rate
read -p "Enter Time Period (in years): " time

# Validate that inputs are not empty
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
    echo "Error: Principal, Rate, and Time are all required."
    exit 1
fi

# Calculate simple interest using bc for floating point support
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo ""
echo "--------------------------------------"
echo "Principal Amount   : $principal"
echo "Rate of Interest   : $rate%"
echo "Time Period         : $time year(s)"
echo "Simple Interest     : $simple_interest"
echo "Total Amount         : $total_amount"
echo "--------------------------------------"
