from PIL import Image
import cv2
import numpy as np
import tkinter as tk
import threading
import math
import csv
from numba import jit


def backCalcINT(H, S, V):
    E = 65535
    bitShift = 16
    RGB = [0, 0, 0]
    I = 0

    # Step 0 check for special case where S or V are 0
    if S == 0 or V == 0:
        RGB = [V, V, V]
        return RGB

    # Step 1 - Back Calculate d and m
    d = int(((S * V) >> bitShift) + 1)

    print(f"S*V: {S*V}")
    print(f"(S*V)>>16: {(S*V)>>16}")
    print(f"d: {d}")


    m = int(V - d)
    print(f"min: {m}")

    # Step 2 - Determine the Selector index based on the value of H
    if H < E:
        I = 0
    elif E <= H < (2 * E):
        I = 1
    elif (2 * E) <= H < (3 * E):
        I = 2
    elif (3 * E) <= H < (4 * E):
        I = 3
    elif (4 * E) <= H < (5 * E):
        I = 4
    elif H >= (5 * E):
        I = 5
    print(f"I: {I}")

    # Step 3 Calculate F, add 1 if F is equal to 0
    # H = C, E = A (0XFFFF), I = B
    F = int(H - (E * I)) + 1
    print(f"E*I: {E*I}")
    print(f"F before special case:")


    # Step 3 If the selector index is 1,3, or 5, undo the inversion of F done in the RGB-HSV conversion
    if I % 2 != 0:
        print(f"Special case for I = 1,3,5 run")
        F = int(E - F)
    print(f"F: {F}")

    # Step 4 Calculate C based on F and D
    c = int(((F * d) >> bitShift) + m) + 1
    print(f"F*d: {F*d}")
    print(f"(F*d) >> 16: {(F*d)>>16}")
    print(f"c: {c}")


    # Step 5 Output the RGB values according to the selector index
    if I == 0:
        RGB = [V, c, m]
    elif I == 1:
        RGB = [c, V, m]
    elif I == 2:
        RGB = [m, V, c]
    elif I == 3:
        RGB = [m, c, V]
    elif I == 4:
        RGB = [c, m, V]
    elif I == 5:
        RGB = [V, m, c]

    return RGB


def calcHSVINT(R, G, B, divisor_inv, precision):
    E = 65535
    bitShift = 16

    # Step 1 find the min, max and mid of RGB
    rg = R-G
    rb = R-B
    gb = G-B
    muxsel = [0,0,0]

    if rg < 0:
        muxsel[0] = 1
    else:
        muxsel[0] = 0

    if rb < 0:
        muxsel[1] = 1
    else:
        muxsel[1] = 0

    if gb < 0:
        muxsel[2] = 1
    else:
        muxsel[2] = 0

    if muxsel == [0,0,0]:
        m = B
        M = G
        c = R
    elif muxsel == [0,0,1]:
        m = G
        M = R
        c = B
    elif muxsel == [0,1,0]:
        print("Impossible value!!")
    elif muxsel == [0,1,1]:
        m = G
        M = B
        c = R
    elif muxsel == [1,0,0]:
        m = B
        M = G
        c = R
    elif muxsel == [1,0,1]:
        m = R
        M = B
        c = G
    elif muxsel == [1,1,0]:
        m = R
        M = G
        c = B
    elif muxsel == [1,1,1]:
        m = R
        M = B
        c = G


    #temp_list = np.array([R, G, B], dtype=np.int64)
    #m = min(R, G, B)
    #M = max(R, G, B)
    #c = int(np.median(temp_list))
    print(f"Min: {m} | Max: {M} | Mid: {c}\n")

    # Step 2 Set V equal to M
    V = M
    print(f"V: {V}\n")

    # Step 3 calculate the difference between M and m, if its 0, set S to 0, and H to -1 (It is undefined in this case)
    d = int(M - m)
    print(f"d: {d}\n")
    if d == 0 or V == 0:
        S = 0
        H = -1
        return H, S, V

    # Step 4 calculate S using d and V
    S = int(((d << bitShift) - 1) * divisor_inv[V] >> precision)
    print(f"d<<{bitShift}: {d<<bitShift}\n")
    print(f"d<<{bitShift}-1: {(d<<bitShift)-1}\n")
    print(f"(d<<{bitShift} - 1) * {divisor_inv[V]}: {(((d << bitShift) - 1) * divisor_inv[V])}\n")
    print(f"(d<<{bitShift} - 1) * {divisor_inv[V]} >> {precision}: {S}\n")

    # Step 5 find the selector index based on which color is the Min/Max, special case is needed if two are the same
    if M == R and m == B:
        I = 0
    elif M == G and m == B:
        I = 1
    elif M == G and m == R:
        I = 2
    elif M == B and m == R:
        I = 3
    elif M == B and m == G:
        I = 4
    elif M == R and m == G:
        I = 5

    print(f"I: {I}")


    # Step 6 calculate F using c, m and d, check if I is 1,3,5 and set F to its inverse
    F = int(((int(c - m) << bitShift) * divisor_inv[d] >> precision)) # C is middle value, m is minimum, d is difference between max and min
    print(f"c - m: {c-m}\n")
    print(f"(c-m)<<{bitShift}: {(c - m) << bitShift}\n")
    print(f"(c-m)<<{bitShift} * {divisor_inv[d]}: {((c - m) << bitShift)*divisor_inv[d]}\n")
    print(f"(c-m)<<{bitShift} * {divisor_inv[d]} >> {precision}: {F}\n")

    if I % 2 != 0:
        F = E - F
        print(f"Special Case run for F. F: {F}\n")


    # Step 7 calculate H using E, I and F
    H = (I << 16) + F
    print(f"E*I: {E*I}\n")
    print(f"H: {H}\n")

    return H, S, V


@jit(nopython=True)
def calcHSVINT_no_print(R, G, B, divisor_inv, precision):
    E = 65535
    bitShift = 16

    # Step 1 find the min, max and mid of RGB
    rg = R-G
    rb = R-B
    gb = G-B
    muxsel = [0,0,0]

    if rg < 0:
        muxsel[0] = 1
    else:
        muxsel[0] = 0

    if rb < 0:
        muxsel[1] = 1
    else:
        muxsel[1] = 0

    if gb < 0:
        muxsel[2] = 1
    else:
        muxsel[2] = 0

    if muxsel == [0,0,0]:
        m = B
        M = R
        c = G
    elif muxsel == [0,0,1]:
        m = G
        M = R
        c = B
    elif muxsel == [0,1,0]:
        print("Impossible value!!")
    elif muxsel == [0,1,1]:
        m = G
        M = B
        c = R
    elif muxsel == [1,0,0]:
        m = B
        M = G
        c = R
    elif muxsel == [1,0,1]:
        m = R
        M = B
        c = G
    elif muxsel == [1,1,0]:
        m = R
        M = G
        c = B
    elif muxsel == [1,1,1]:
        m = R
        M = B
        c = G

    #temp_list = np.array([R, G, B], dtype=np.int64)
    #m = min(R, G, B)
    #M = max(R, G, B)
    #c = int(np.median(temp_list))

    # Step 2 Set V equal to M
    V = M

    # Step 3 calculate the difference between M and m, if its 0, set S to 0, and H to -1 (It is undefined in this case)
    d = int(M - m)
    if d == 0 or V == 0:
        S = 0
        H = -1
        return H, S, V

    # Step 4 calculate S using d and V
    S = int(((d << bitShift) - 1) * divisor_inv[V] >> precision)



    # Step 5 find the selector index based on which color is the Min/Max, special case is needed if two are the same
    if M == R and m == B:
        I = 0
    elif M == G and m == B:
        I = 1
    elif M == G and m == R:
        I = 2
    elif M == B and m == R:
        I = 3
    elif M == B and m == G:
        I = 4
    elif M == R and m == G:
        I = 5


    # Step 6 calculate F using c, m and d, check if I is 1,3,5 and set F to its inverse
    F = int(((int(c - m) << 16) * divisor_inv[d] >> precision)) # C is middle value, m is minimum, d is difference between max and min


    if I % 2 != 0:
        F = E - F


    # Step 7 calculate H using E, I and F
    H = (E * I) + F

    return H, S, V


@jit(nopython=True)
def backCalcINT_no_print(H, S, V):
    E = 65535
    bitShift = 16
    RGB = [0, 0, 0]
    I = 0

    # Step 0 check for special case where S or V are 0
    if S == 0 or V == 0:
        RGB = [V, V, V]
        return RGB

    # Step 1 - Back Calculate d and m
    d = int(((S * V) >> bitShift) + 1)


    m = int(V - d)

    # Step 2 - Determine the Selector index based on the value of H
    if H < E:
        I = 0
    elif E <= H < (2 * E):
        I = 1
    elif (2 * E) <= H < (3 * E):
        I = 2
    elif (3 * E) <= H < (4 * E):
        I = 3
    elif (4 * E) <= H < (5 * E):
        I = 4
    elif H >= (5 * E):
        I = 5

    # Step 3 Calculate F, add 1 if F is equal to 0
    F = int(H - (E * I))
    #if F == 0:
        #F += 1

    # Step 3 If the selector index is 1,3, or 5, undo the inversion of F done in the RGB-HSV conversion
    if I % 2 != 0:
        F = int(E - F)

    # Step 4 Calculate C based on F and D
    c = int(((F * d) >> bitShift) + m) + 1

    # Step 5 Output the RGB values according to the selector index
    if I == 0:
        RGB = [V, c, m]
    elif I == 1:
        RGB = [c, V, m]
    elif I == 2:
        RGB = [m, V, c]
    elif I == 3:
        RGB = [m, c, V]
    elif I == 4:
        RGB = [c, m, V]
    elif I == 5:
        RGB = [V, m, c]

    return RGB


@jit(nopython=True)
def backCalcFP(H, S, V):
    h_floored = int(math.floor(H))
    h_sub_i = int(h_floored / 60) % 6
    var_f = (H / 60.0) - (h_floored // 60)
    var_p = V * (1.0 - S)
    var_q = V * (1.0 - var_f * S)
    var_t = V * (1.0 - (1.0 - var_f) * S)

    if h_sub_i == 0:
        rgb_r = V
        rgb_g = var_t
        rgb_b = var_p
    elif h_sub_i == 1:
        rgb_r = var_q
        rgb_g = V
        rgb_b = var_p
    elif h_sub_i == 2:
        rgb_r = var_p
        rgb_g = V
        rgb_b = var_t
    elif h_sub_i == 3:
        rgb_r = var_p
        rgb_g = var_q
        rgb_b = V
    elif h_sub_i == 4:
        rgb_r = var_t
        rgb_g = var_p
        rgb_b = V
    elif h_sub_i == 5:
        rgb_r = V
        rgb_g = var_p
        rgb_b = var_q

    RGB = [rgb_r, rgb_g, rgb_b]
    return RGB


@jit(nopython=True)
def calcHSVFP(R, G, B):
    M = max(R, G, B)
    m = min(R, G, B)

    if M == m:
        H = 0.0
    elif M == R:
        H = (60.0 * ((G - B) / (M - m)) + 360) % 360.0
    elif M == G:
        H = 60.0 * ((B - R) / (M - m)) + 120
    elif M == B:
        H = 60.0 * ((R - G) / (M - m)) + 240.0

    if M == 0:
        S = 0
    else:
        S = 1.0 - (m / M)

    V = M

    return H, S, V


def process_image(input_filename, output_filename):
    # Open the input image
    image = Image.open(input_filename)
    pixels = image.load()
    # Process each pixel
    for y in range(image.height):
        for x in range(image.width):
            # Get the RGB values
            R, G, B = pixels[x, y]

            # Convert to HSV
            H, S, V = calcHSVINT_no_print(R, G, B)

            H = H + 6032  # Example adjustment
            S = S + 5875  # Example adjustment
            # Convert back to RGB
            R_new, G_new, B_new = backCalcINT_no_print(H, S, V)

            # Write the new RGB values back to the pixel
            pixels[x, y] = (int(R_new), int(G_new), int(B_new))

    # Save the output image
    image.save(output_filename)


def process_image_live(input_filename, h_adjust, s_adjust, v_adjust, r_adjust, g_adjust, b_adjust, processFormat, divisor_inv, precision):
    # Open the input image
    image = Image.open(input_filename)
    pixels = image.load()

    # Store the original RGB values
    original_pixels = [[pixels[x, y] for y in range(image.height)] for x in range(image.width)]
    while True:
        # Process each pixel
        for y in range(image.height):
            for x in range(image.width):
                # Get the original RGB values
                R, G, B = original_pixels[x][y]

                R += r_adjust.get()
                G += g_adjust.get()
                B += b_adjust.get()

                # Convert to HSV
                if processFormat == "INT":
                    H, S, V = calcHSVINT_no_print(R, G, B, divisor_inv, precision)
                elif processFormat == "FP":
                    H, S, V = calcHSVFP(R, G, B)

                # Adjust H, S, and V values
                if processFormat == "INT":

                    H += h_adjust.get()
                    S += s_adjust.get()
                    V += v_adjust.get()


                elif processFormat == "FP":
                    H += h_adjust.get()
                    S += (s_adjust.get() / 100)
                    V += v_adjust.get()

                # Convert back to RGB
                if processFormat == "INT":
                    R_new, G_new, B_new = backCalcINT_no_print(H, S, V)
                elif processFormat == "FP":
                    R_new, G_new, B_new = backCalcFP(H, S, V)

                cv2.setWindowProperty('Image', cv2.WND_PROP_AUTOSIZE, cv2.WINDOW_NORMAL)
                # Write the new RGB values back to the pixel
                pixels[x, y] = (int(R_new), int(G_new), int(B_new))

            # Update the image display after each row of pixels is processed
            cv2.imshow('Image', cv2.cvtColor(np.array(image), cv2.COLOR_RGB2BGR))
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break

        # Break the infinite loop if 'q' was pressed
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cv2.destroyAllWindows()


def tkinterWindow(imageFilename, divisor_inv, precision):
    window = tk.Tk()
    processFormat = "INT"
    if processFormat == "INT":
        h_adjust = tk.Scale(window, from_=-195_000, to=195_000, length=500, label='Hue Adjust', orient='horizontal')
        s_adjust = tk.Scale(window, from_=-65535, to=65535, length=500, label='Saturation Adjust', orient='horizontal')
        v_adjust = tk.Scale(window, from_=-255, to=255, length=500, label='Value Adjust', orient='horizontal')
    elif processFormat == "FP":
        h_adjust = tk.Scale(window, from_=-180, to=180, length=500, label='Hue Adjust', orient='horizontal')
        s_adjust = tk.Scale(window, from_=-100, to=100, length=500, label='Saturation Adjust', orient='horizontal')
        v_adjust = tk.Scale(window, from_=-100, to=100, length=500, label='Value Adjust', orient='horizontal')

    r_adjust = tk.Scale(window, from_=-255, to=255, length=500, label='Red CH Adjust', orient='horizontal')
    g_adjust = tk.Scale(window, from_=-255, to=255, length=500, label='Green CH Adjust', orient='horizontal')
    b_adjust = tk.Scale(window, from_=-255, to=255, length=500, label='Blue CH Adjust', orient='horizontal')

    h_adjust.pack()
    s_adjust.pack()
    v_adjust.pack()
    r_adjust.pack()
    g_adjust.pack()
    b_adjust.pack()

    threading.Thread(target=process_image_live, args=(imageFilename, h_adjust, s_adjust, v_adjust, r_adjust, g_adjust, b_adjust, processFormat, divisor_inv, precision)).start()

    window.mainloop()


# Used for finding edge case bugs
def singlePixelTest(divisor_inv, precision):
    while True:
        # Choose input type
        input_type = input("Enter the type of input (hex or decimal): ").lower()
        if input_type not in ["hex", "decimal"]:
            print("Invalid input type, please enter 'hex' or 'decimal'.")
            continue

        if input_type == "hex":
            hex_string = input("Enter RGB values as a hex string (RRGGBB): ")
            if len(hex_string) != 6:
                print("Invalid hex string, please enter a valid 6 character string.")
                continue
            R = int(hex_string[0:2], 16)
            G = int(hex_string[2:4], 16)
            B = int(hex_string[4:6], 16)
        elif input_type == "decimal":
            R = int(input("Enter a R Value to test (or 999 to exit): "))
            if R == 999:
                exit()
            G = int(input("Enter a G Value to test: "))
            B = int(input("Enter a B Value to test: "))

        print("Hex Values for RGB: {} {} {}\n".format(hex(R), hex(G), hex(B)))

        print("Calculating HSV values from RGB")
        H, S, V = calcHSVINT(R, G, B, divisor_inv, precision)
        print("H: {} | S: {} | V: {}\n".format(H, S, V))

        # If the HSV conversion is correct, then it should perfectly back calculate to the original RGB values
        print("---------------------------------------------------------------")
        print("Back Calculating RGB values from HSV")
        R, G, B = backCalcINT(H, S, V)
        print("RGB Values: R: {} | G: {} | B:{}\n".format(R, G, B))
        print("Hexadecimal Values: R: {} | G: {} | B: {}\n".format(hex(R), hex(G), hex(B)))


@jit(nopython=True)
def loop_colors(divisor_inv, precision):
    match = 0
    fuzzy = 0
    mismatch = 0
    mismatched_colors = []
    for R in range(256):
        for G in range(256):
            for B in range(256):
                H, S, V = calcHSVINT_no_print(R, G, B, divisor_inv, precision)
                R_back, G_back, B_back = backCalcINT_no_print(H, S, V)

                if R == R_back and G == G_back and B == B_back:
                    match += 1
                elif ((abs(R - R_back)) <= 1) or ((abs(G - G_back)) <= 1) or (
                        (abs(B - B_back)) <= 1):
                    mismatched_colors.append(((R, G, B), (R_back, G_back, B_back)))
                    fuzzy += 1
                elif ((abs(R - R_back)) > 2) or ((abs(G - G_back)) > 2) or (
                        (abs(B - B_back)) > 2):
                    mismatch += 1
                    #mismatched_colors.append(((R, G, B), (R_back, G_back, B_back)))

    return match, fuzzy, mismatch, mismatched_colors


def color_tester(divisor_inv, precision):
    print("Testing Integer Converter...\n")
    match, fuzzy, mismatch, mismatched_colors = loop_colors(divisor_inv, precision)

    print(f"Percentage of colors that perfect: {(match / (256 ** 3)) * 100}% | {match} Colors")
    print(
        f"Percentage of colors that are near perfect (+/- <2%): {(fuzzy / (256 ** 3)) * 100}% | {fuzzy} near perfect Colors")
    print(
        f"Percentage of colors that mismatched (+/- >2%): {(mismatch / (256 ** 3)) * 100}% | {mismatch} mismatched Colors")

    # Open a CSV file in write mode ('w') and write the mismatched colors to it.
    with open('mismatched_colors_ints.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Original RGB', 'Calculated RGB'])  # Write header
        for original, calculated in mismatched_colors:
            writer.writerow([original, calculated])  # Write each row

    '''
    print("----------------------------------------------------------------------------------------")
    print("Testing Floating Point Converter...\n")
    match = 0
    fuzzy = 0
    mismatch = 0
    mismatched_colors = []

    for R in range(256):
        for G in range(256):
            for B in range(256):
                H, S, V = calcHSVFP(R, G, B)
                R_back, G_back, B_back = backCalcFP(H, S, V)

                if R == R_back and G == G_back and B == B_back:
                    match += 1
                elif (abs(R - R_back) / 255) <= 0.05 and (abs(G - G_back) / 255) <= 0.05 and (
                        abs(B - B_back) / 255) <= 0.05:
                    fuzzy += 1
                else:
                    mismatch += 1
                    mismatched_colors.append(((R, G, B), (R_back, G_back, B_back)))

    print(f"Percentage of colors that matched: {(match / (256 ** 3)) * 100}% | {match} Colors")
    print(f"Percentage of colors that are fuzzy (+/- 2%-5%): {(fuzzy / (256 ** 3)) * 100}% | {fuzzy} fuzzy Colors")
    print(f"Percentage of colors that mismatched (+/- >5%): {(mismatch / (256 ** 3)) * 100}% | {mismatch} mismatched Colors")

    # Open a CSV file in write mode ('w') and write the mismatched colors to it.
    with open('mismatched_colors_FP.csv', 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow(['Original RGB', 'Calculated RGB'])  # Write header
        for original, calculated in mismatched_colors:
            writer.writerow([original, calculated])  # Write each row
    '''


def generate_inverse_values():
    precision = 16
    # Find the inverse of v
    divisor_inv = [0] * 256
    # Populate array with the inverse of each value
    for i in range(1, 256):
        divisor_inv[i] = (1 << precision) // i

    return divisor_inv, precision


if __name__ == '__main__':
    divisor_inv, precision = generate_inverse_values()
    option = input("Select Option (spt - single pixel test, pi - process image file, lia - live image adjustment, ct - color tester): ")
    imageFilename = "window.jpg"
    if option == "pi":
        process_image('contrastIN.png',
                      'contrastOUT.png')  # Used for single shot image adjustment, not especially useful
    elif option == "spt":
        singlePixelTest(divisor_inv, precision)  # Used for edge case debugging
    elif option == "lia":
        tkinterWindow(imageFilename, divisor_inv, precision)  # Live image adjustments!
    elif option == "ct":
        color_tester(divisor_inv, precision)
