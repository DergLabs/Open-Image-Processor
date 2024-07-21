import tkinter as tk
import serial

""" 
TODO - Add ability to stream Image to FPGA over SPI (This will be slow as shit)
- Far future: Configure USB-Serial IO on FPGA for faster comms
- Add selection boxes for conditional computing register (Select Color condition, true exec, false exec)
- Start with option for upto 16 color conditions (Expand to 1K Colors later)
- Use either color slider or enter hex values for conditon
- Allow for programmign via CCL (Color Condition Language) HSV conditions will be supported in the future
- CCL Follows this format: 
    IF (<COLOR VALUE>, <HUE VALUE>, <SAT VALUE>, <LUMINANCE VALUE>) THEN
        ADJUST RGBHSV {<R VALUE>, <G VALUE>, <B VALUE>, <H VALUE>, <S VALUE>, <V VALUE>}
    ELSE 
        ADJUST RGBHSV {<R VALUE>, <G VALUE>, <B VALUE>, <H VALUE>, <S VALUE>, <V VALUE>}
    END

Color Condition Processor function:
16 RAM locations will be used to contain the SET RGBHSV values
LUT will be used to select RAM location based on COLOR or HSV Value's
Condition Processor will contain RGB and HSV ALU's, it will be placed inbetween RGB-HSV and HSV-RGB converters
    
"""


# Initialize PySerial connection
# ser = serial.Serial('COM6', 115200, timeout=1) # For Windows, replace COM6 with RP2040 com port
ser = serial.Serial('/dev/tty.usbmodem2101', 115200, timeout=1) # For Mac, replace usbmodem2101 with RP2040 port
ser.flush()


def send_message(name, *args):
    # G and B channels are swapped in the FPGA for some stupid reason due to the way HDMI is decoded, swapping them here is just
    # a quick fix to make the sliders work as expected
    # Determine which variable changed based on the name
    if name == var_r._name:
        message = f"R:{var_r.get()}|G:{var_b.get()}|B:{var_g.get()}"
    elif name == var_g._name:
        message = f"R:{var_r.get()}|G:{var_b.get()}|B:{var_g.get()}"
    elif name == var_b._name:
        message = f"R:{var_r.get()}|G:{var_b.get()}|B:{var_g.get()}"
    else:
        message = f"H:{var_h.get()}|S:{var_s.get()}|V:{var_v.get()}"

    # Append LF line ending
    message += '\n'

    # Send the constructed message via PySerial
    ser.write(message.encode('utf-8'))

def zero_out():
    var_h.set(0)
    var_s.set(0)
    var_v.set(0)
    var_r.set(0)
    var_g.set(0)
    var_b.set(0)


# Create the main window
root = tk.Tk()
root.title("RGB & HSV Sliders")

# Create IntVar variables and bind them to the trace method
var_h = tk.IntVar()
var_h.trace("w", send_message)
var_s = tk.IntVar()
var_s.trace("w", send_message)
var_v = tk.IntVar()
var_v.trace("w", send_message)
var_r = tk.IntVar()
var_r.trace("w", send_message)
var_g = tk.IntVar()
var_g.trace("w", send_message)
var_b = tk.IntVar()
var_b.trace("w", send_message)

# Create sliders
h_slider = tk.Scale(root, from_=-390_000, to=390_000, length=500, label='Hue Adjust', orient='horizontal', variable=var_h)
h_slider.grid(row=0, column=1)
tk.Label(root, text="H:").grid(row=0, column=0)

s_slider = tk.Scale(root, from_=-65535, to=65535, length=500, label='Saturation Adjust', orient='horizontal', variable=var_s)
s_slider.grid(row=1, column=1)
tk.Label(root, text="S:").grid(row=1, column=0)

v_slider = tk.Scale(root, from_=-255, to=255, length=500, label='Value Adjust', orient='horizontal', variable=var_v)
v_slider.grid(row=2, column=1)
tk.Label(root, text="V:").grid(row=2, column=0)

r_slider = tk.Scale(root, from_=-255, to=255, length=500, label='Red CH Adjust', orient='horizontal', variable=var_r)
r_slider.grid(row=3, column=1)
tk.Label(root, text="R:").grid(row=3, column=0)


g_slider = tk.Scale(root, from_=-255, to=255, length=500, label='Green CH Adjust', orient='horizontal', variable=var_g)
g_slider.grid(row=4, column=1)
tk.Label(root, text="G:").grid(row=4, column=0)

b_slider = tk.Scale(root, from_=-255, to=255, length=500, label='Blue CH Adjust', orient='horizontal', variable=var_b)
b_slider.grid(row=5, column=1)
tk.Label(root, text="B:").grid(row=5, column=0)

zero_out_btn = tk.Button(root, text="Zero Out", command=zero_out)
zero_out_btn.grid(row=6, column=1)

root.mainloop()

# Close the serial connection
ser.close()