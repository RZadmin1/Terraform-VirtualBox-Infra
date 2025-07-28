#!/bin/bash

# List of test users
users=("alice" "bob" "charlie")

# Create keys directory if it doesn't exist
mkdir -p keys

# Loop through each user
for user in "${users[@]}"; do
    key_path="keys/${user}"
    
    # Skip if key already exists
    if [[ -f "${key_path}" ]]; then
        echo "Key for ${user} already exists, skipping..."
        continue
    fi

    # Generate key without passphrase
    ssh-keygen -t rsa -b 2048 -f "${key_path}" -N "" -C "${user}@example.com"
    echo "Generated SSH key for ${user}"
done
