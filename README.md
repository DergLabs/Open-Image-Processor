# Open Image Processor
An open-source, multi-core image processor capable of real-time video and image processing. It is implemented using logisim evolution, Python, C++, Vivado, VHDL, Verilog, and SystemVerilog.

## Structure
**Old Designs:** This folder contains early designs of the image processing core developed in logisim.
**Processor Verification Programs:** This folder contains three test programs:
**C++ Program:** Offers a fast accuracy test for the integer-based RGB-HSV and HSV-RGB conversion algorithm used in the image processor cores. Detailed functionality in the **integer_based_rgb2hsv** Python program, but faster in C++.
**Python Programs:** The **fast_image_editor** provides a live image editing window with RGB and HSV sliders, used for quality and functionality testing. The **integer_based_rgb2hsv** script includes live image editing, color accuracy testing, single-color conversions, and more.
**Vivado Project & FPGA Implementation:** The full project is found in Vivado/IMP, built in Vivado 2022.1 and synthesized for an Artix-7 35T FPGA on the Alynx AX7035 board. In the near future, expect implementation on the Artix Duo FPGA board and Kintex/Zynq FPGA's. Current power consumption is estimated at ~0.8W at 1680x1050p 60FPS with 15 Cores.

## Architecture
The processing cores currently perform a simple RGB-HSV-RGB passthrough. DSP cores will be added to provide RGB and HSV adjustment. With the RGB and HSV adjustment included, upto 10 Cores can be implemented on the Artix-7 35T. This is purely limited by the number of DSP cores. A total of 9 DSP's are used per core, 3 in the RGB-HSV conversion, 3 in the HSV-RGB conversion, 1 for the RGB adjustment, and 2 for the HSV adjustment. The cores are linked using a simple combinational logic-based arbiter. The arbiter consists of a dual clock input FIFO, input DMUX, core priority/availability encoder, output MUX and output dual clock FIFO. 

The processing cores have 2 primary inputs (RGB in and Data Valid) and 4 primary outputs (RGB OUT, rgb2hsv_data_ready, n_core_busy, hsv2rgb_data_ready). When a pixel is sent to the core, data valid must be pulsed high at the same time for exactly one clock cycle. Once a pixel is sent to the core, the n_core_busy signal will be driven low (This is an active low signal). The data valid pulse will propagate through the core with the pixel and after 13 clock cycles, the pixel will be sent from the RGB2HSV core to the HSV2RGB core. At this time, n_core_busy will go high, signifying that it is free to receive a new pixel. The n_core_busy signals of all cores are connected to a priority encoder. The output of this encoder is then connected to the DMUX select input. A similar scheme is used for the output MUX. When a pixel has finished processing, the hsv2rgb_data_ready signal will go high. This signal is sent to another priority encoder with its output connected to the MUX select signal. The output of the mux feeds into the output fifo which handles the clk domain crossing. 

## Future Work
- Add RGB/HSV adjustment cores using DSP processors, 32-bit registers will be used for control data
- Fix Hsync/Vsync delays
- Fix unexpected reset behavior
- Fix core clock incompatibility (Currently the cores must operate at an integer multiple of pixel clk)
- Add 1920x1080p 60FPS support. The cores can support this but some issue in the encode/decode logic causes instability
- Investigate convolution image compression engine & DDR3 Frame buffering

## Example Outputs:

This is an example output using the **fast_image_edditor** python program, implementing the integer conversion algorithm.

**Original Image:**

![Original Image](https://imgur.com/4zXKKuI.png)

**Processed Image:**

![Processed Image](https://imgur.com/a/E9Fj7eH.png)
