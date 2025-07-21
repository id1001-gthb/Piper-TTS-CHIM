#!/bin/bash
clear
cat << EOF
PIPERTTS

This will install Piper-TTS. This is an efficient TTS service that can run on CPU with low latency.

EOF

if [ ! -f /home/dwemer/python-piper/lib/python3.11/site-packages/piper/const.py ]; then
        exit "PIPERTTS not installed"
fi

mapfile -t files < <(find /home/dwemer/piper/  -name "start-piper*.sh")
# Check if any files were found

if [ ${#files[@]} -eq 0 ]; then
    echo "No files found matching the start-piper*.sh pattern."
    exit 1
fi

# Display the files in a numbered list
echo -e "Select a an option from the list:\n\n"
for i in "${!files[@]}"; do
    echo "$((i+1)). ${files[$i]}"
done

echo "0. Disable service";
echo

# Prompt the user to make a selection
read -p "Select an option by picking the matching number: " selection

# Validate the input

if [ "$selection" -eq "0" ]; then
    echo "Disabling service. Run this script again to enable"
    rm /home/dwemer/piper/start.sh
    exit 1
fi

if ! [[ "$selection" =~ ^[0-9]+$ ]] || [ "$selection" -lt 1 ] || [ "$selection" -gt ${#files[@]} ]; then
    echo "Invalid selection."
    exit 1
fi

# Get the selected file
selected_file="${files[$((selection-1))]}"

echo "You selected: $selected_file"

ln -sf $selected_file /home/dwemer/piper/start.sh




