#!/bin/bash

# Parse Hyprland keybinds.conf file
KEYBINDS_FILE="/home/manish/.config/hypr/keybinds.conf"

if [ ! -f "$KEYBINDS_FILE" ]; then
    echo "[]"
    exit 1
fi

output=""

# Read file line by line
while IFS= read -r line; do
    # Skip empty lines and comments
    [[ -z "$line" || "$line" =~ ^[[:space:]]*# ]] && continue
    if [[ "$line" =~ ^[[:space:]]*bindd[[:space:]]*= ]]; then
        # Split by = and get the definition part
        definition="${line#*=}"
        definition="${definition#"${definition%%[![:space:]]*}"}"  # trim leading whitespace
        
        # Split definition by comma and get the second and third fields (indices 1 and 2)
        IFS=',' read -ra fields <<< "$definition"
        if [ ${#fields[@]} -ge 3 ]; then
            key="${fields[1]}"
            def="${fields[2]}"
            key="${key#"${key%%[![:space:]]*}"}"  # trim leading whitespace
            def="${def#"${def%%[![:space:]]*}"}"  # trim leading whitespace
            output+="$key|$def%"
        fi
    fi
done < "$KEYBINDS_FILE"
echo "$output"
