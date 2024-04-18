import json
import sys

# Get paths from arguments
input_path = sys.argv[1]
output_path = sys.argv[2]

# Load the original JSON
with open(input_path, 'r') as f:
    data = json.load(f)

# Extract the "name" key and its value for each service
name_data = [{'name': service,'value': service} for service, info in data.items()]

# Write the new JSON to a file
with open(output_path, 'w') as f:
    json.dump(name_data, f)