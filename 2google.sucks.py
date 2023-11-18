##googlecorder only
# Define a dictionary to hold the drag start positions outside the transform_line function
drag_start_positions = {}

def transform_line(line, previous_time):
    global drag_start_positions  # This allows us to modify the dictionary defined outside of the function

    if not line.strip():  # Skip empty lines
        return '', previous_time

    parts = line.strip().split(', ')
    event_type = parts[0].split(':')[0]
    timestamp = int(parts[-1].split(': ')[1])
    delay = timestamp - previous_time

    if event_type == "Click":
        button = parts[0].split(': ')[1]
        x_val = parts[1].split('x')[1]
        y_val = parts[2].split('y')[1]
        command = f"Sleep, {delay}\nMouseClick, Left, {x_val}, {y_val}\nSleep, 250"

    elif event_type in ["WheelUp", "WheelDown"]:
        x_val = parts[1].split('x')[1]
        y_val = parts[2].split('y')[1]
        command = f"Sleep, {delay}\nMouseClick, {event_type}, {x_val}, {y_val}\nSleep, 20"

    elif event_type == "Key":
        key = parts[0].split(': ')[1]
        command = f"Sleep, {delay}\nSend, {{{key}}}"

    elif event_type == "Drag Start":
        # Store start position in the dictionary using the current timestamp as the key
        start_x_val = parts[1].split('x')[1]
        start_y_val = parts[2].split('y')[1]
        drag_start_positions[timestamp] = (start_x_val, start_y_val)
        command = f"Sleep, {delay}\n; Drag Start at {start_x_val}, {start_y_val}"

    elif event_type == "Drag End":
        end_x_val = parts[1].split('x')[1]
        end_y_val = parts[2].split('y')[1]
        # Find the closest "Drag Start" event before this "Drag End"
        start_timestamp = max(k for k in drag_start_positions if k <= timestamp)
        start_x_val, start_y_val = drag_start_positions[start_timestamp]
        command = f"Sleep, {delay}\nMouseClickDrag, Left, {start_x_val}, {start_y_val}, {end_x_val}, {end_y_val}\nSleep, 250"

    else:
        command = line

    return command, timestamp

# Rest of the script for reading and processing the input...

# Path to the input file
input_file_path = r"C:\Users\danewagenhoffer\pyrq\events.txt"

# Reading the input string from the file
with open(input_file_path, 'r') as file:
    input_str = file.read()

# Transforming the input string with a tab preceding each line
previous_time = 0
output_str = ''
for line in input_str.split('\n'):
    transformed_line, previous_time = transform_line(line, previous_time)
    output_str += f'\t{transformed_line}\n\tif (!toggle)\n\t\tbreak\n'

# File path to write the output
output_file_path = r"C:\Users\danewagenhoffer\pyrq\actions.ahk"

# Writing the toggle, transformed content, and ending to the file
with open(output_file_path, 'w') as file:
    file.write("toggle := false\n#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself\nF1::\n    toggle := !toggle\n    while (toggle) {\n")
    file.write(output_str)
    file.write("    }\nreturn\n")

print(f"Content written to {output_file_path}")
