# Open Image Processor
An open-source, multi-core image processor capable of real-time video and image processing. It is implemented using logisim evolution, Python, C++, Vivado, VHDL, Verilog, and SystemVerilog.

## Structure
**Old Designs:** This folder contains early designs of the image processing core developed in logisim.
  
**Processor Verification Programs:** This folder contains three test programs:
  
-  **C++ Program:** Offers a fast accuracy test for the integer-based RGB-HSV and HSV-RGB conversion algorithm used in the image processor cores. Detailed functionality in the **integer_based_rgb2hsv** Python program, but faster in C++.
  
-  **Python Programs:** The **fast_image_editor** provides a live image editing window with RGB and HSV sliders, used for quality and functionality testing. The **integer_based_rgb2hsv** script includes live image editing, color accuracy testing, single-color conversions, and more.

**Vivado Project & FPGA Implementation:** 
- The full project is found in Vivado/IMP, built in Vivado 2022.1 and synthesized for an Artix-7 35T FPGA on the Alynx AX7035 board. In the near future, expect implementation on the Artix Duo FPGA board and Kintex/Zynq FPGA's. Current power consumption is estimated at ~0.5W at 1680x1050p 60FPS with 1 Core.

## Architecture
The processing cores currently perform a simple RGB-HSV-RGB passthrough. DSP cores will be added to provide RGB and HSV adjustment. With the RGB and HSV adjustment included, upto 10 Cores can be implemented on the Artix-7 35T. This is purely limited by the number of DSP cores. A total of 9 DSP's are used per core, 3 in the RGB-HSV conversion, 3 in the HSV-RGB conversion, 1 for the RGB adjustment, and 2 for the HSV adjustment. With the newest architecture overhaul, the need for multiple cores has been removed. The ISP cores are now fully pipelined, supporting a throughput of 1 pixel/clock cycle. Additionally, the cores now feature dynamic clocking, and are configured to operate at the input pixel clock. Two or more ISP cores may be needed when working with pixel clock frequencies higher than FMAX (~300Mhz).

The processing cores have 2 primary inputs (RGB in and Data Valid) and 4 primary outputs (RGB OUT, rgb2hsv_data_ready, n_core_busy, hsv2rgb_data_ready). When a pixel is sent to the core, data valid must be pulsed high at the same time. Once a pixel is sent to the core, the n_core_busy signal will be driven low (This is an active low signal). When data on the ISP core output is valid, the pixel_ready_out signal will go high. The current implementation does not need the pixel ready out signal since only one ISP core is used and operates at the pixel clock, it can be inferred that there will always be a new valid pixel on each clock cycle. 

**FPGA Implementation (Blue - Single ISP Processor Core, Red - HDMI to RGB, Green - RGB to HDMI, Light Turquoise - Internal Logic Analyzer):**

![(Core)](https://imgur.com/20avd61.png)

## Performance: 
- One pixel is processed per clock cycle at the input pixel clock. The total latency from input to output is 39 pixels.
- Adding the RGB and HSV ALU's will increase the latency to ~43 pixels.
- A Ryzen 9 3900X takes 0.83s to process 16.7 million pixels at 4Ghz (Measured using the C++ accuracy test program, which also records execution time). A rough estimation for the power draw is in the range of 10's of watts. In comparison, at a 148.5Mhz pixel clock (used for 1920x1080p 60Hz), a single ISP core can process 16.7 Million pixels in approximately 0.13s while consuming 0.5W.  

## Future Work
- Add GUI Python tool for live image processing
- Investigate convolution image compression engine & DDR3 Frame buffering
- Add Instruction and image mask RAM for dynamic image adjustment

## Example Outputs:

This is an example output using the integer conversion algorithm implemented in the **fast_image_edditor** python program.

**Original Image:**

![Original Image](https://imgur.com/4zXKKuI.png)

**Processed Image:**

![Processed Image](https://imgur.com/z2iWIP8.png)


## Example FPGA Output:

These are some example outputs from the FPGA running at 1680x1050 60Hz. 

## Original Image:
![Original Image](https://imgur.com/ESCLlk1.png)

## Processed Images:

![V1](https://imgur.com/tdg8dgS.png)

![V2](https://imgur.com/rfsa5HA.png)
