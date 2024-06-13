


# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 num1 num2" >&2
    exit 1
fi

# Check if both arguments are natural numbers
if ! [[ "$1" =~ ^[0-9]+$ ]] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
    echo "Error: Both arguments must be natural numbers" >&2
    exit 1
fi

num1=$1
num2=$2

# Function to calculate GCD
gcd() {
    local a=$1
    local b=$2
    while [ "$b" -ne 0 ]; do
        local temp=$b
        b=$((a % b))
        a=$temp
    done
    echo "$a"
}

# Calculate and output GCD
gcd_result=$(gcd "$num1" "$num2")
echo "$gcd_result"
EOF
