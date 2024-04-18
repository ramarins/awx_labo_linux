import os
import json
import sys

# Directory containing the JSON files
dir_path = sys.argv[1]
output_path = f"{dir_path}/hosts.json"

# Get a list of all JSON files in the directory
hostname_list = [os.path.splitext(f)[0] for f in os.listdir(dir_path) if f.endswith('.json')]

# Create a dictionary with the names
data = [{'name': hostname,'value': hostname} for hostname in hostname_list]

# Print the JSON formatted string
with open(output_path, 'w') as f:
    json.dump(data, f)