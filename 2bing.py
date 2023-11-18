#Bingcorder
def transform_line(line):
    if line.startswith("Click:"):
        _, button, _, coordinates = line.split(' ', 3)
        x_val = coordinates.split(',')[0].split('x')[1]
        y_val = coordinates.split(',')[1].split('y')[1]
        button_name = "Left" if button == "LButton," else "Right"
        return f"MouseClick, {button_name}, {x_val}, {y_val}\nSleep, 250"

    elif line.startswith("Wheel"):
        direction = line.strip()
        return f"MouseClick, {direction}\nSleep, 20 ; Pause between each scroll"
    elif line.startswith("Key:"):
        parts = line.split(', ')
        key = parts[0].split(': ')[1]
        ctrl = parts[2].split(': ')[1] == "Yes"
        shift = parts[3].split(': ')[1] == "Yes"

        modifiers = ''
        if ctrl:
            modifiers += '^'
        if shift:
            modifiers += '+'

        return f"Send, {modifiers}{{{key}}}"
    else:
        return line

# Path to the input file
input_file_path = r"C:\Users\DaneWagenhoffer\pyrq\events.txt"

# Reading the input string from the file
with open(input_file_path, 'r') as file:
    input_str = file.read()

# Transforming the input string with a tab preceding each line
output_str = '\n'.join([f'\t{transform_line(line)}\n\tif (!toggle)\n\t\tbreak' for line in input_str.split('\n')])

# File path to write the output
output_file_path = r"C:\Users\danewagenhoffer\pyrq\actions.ahk"

# Writing the toggle, transformed content, and ending to the file
with open(output_file_path, 'w') as file:
    # Writing the toggle
    file.write("toggle := false\n#MaxThreadsPerHotkey 2  ; Allows a hotkey to interrupt itself\nF1::\n    toggle := !toggle\n    while (toggle) {\n")
    # Writing the transformed content
    file.write(output_str)
    # Writing the ending
    file.write("\n    }\nreturn\n")

print(f"Content written to {output_file_path}")
