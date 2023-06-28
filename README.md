# PLU
Pixel Logic Unit simulation used to simple image processing applications.

**Overview**

This image processor was designed in Logisim Evolution and is intended for implementation on the ArtixDuo FPGA board.

A sample image png has been provided along with its Hex file generated using my PNG to Hex python script. The two files are titled "Contrast"

The processor architecture is relatively simple, consisting of three 8-bit integer ALU's (one for each color channel). Each ALU can perform Add, Subtract, Multiply, Divide, Bit shift left/right, AND, OR, NOT, NOR, NAND, XOR, XNOR, Passthrough A, and Passthrough B.

A 32-bit instruction word is used allowing each ALU to perform a unique operation for its respective color channel. Each ALU has two inputs A and B. Input A is designated for the pixel color data to be processed, input B is a control data input used to perform operations on the pixel data and can be any 8-bit data input. 

The PLU can perform one operation per clock cycle. A minimum of 2 clock cycles are needed for the current configuration due to the registered inputs and outputs. This can be changed by removing the input/output registers allowing for single clock cycle operation. 

The input/output registers allow for multiple operations to be performed per pixel. The current design supports up to 16 operations per pixel. An excel file has been created to assemble 32-bit hex instructions that can be loaded into the instruction ROM. The PNG-To-HEX project can be used to generate hex files that can be loaded into the image ROM. The visual basic functions used in the excel file have also been provided. Macros are required for the excel file to work (A proper C assembler will be developed once the PLU architecture is finalized)

**Logisim Usage:**

The following setup is REQUIRED for anything to happen:
- The first instruction (LOAD) in the instruction ROM MUST be 0x3F190410 - This loads a pixel into the input registers
- The last instruction (NEXT) MUST be 0x3F1B0C30 - This sends the loaded pixel into the output register and toggles the pixel clk high, allowing the pixel to be displayed
- If you do not need 16 instructions, you can use the "NEXT_JUMP" instruction to reset the program counter. 
- ALL unused instructions between the "LOAD" and "NEXT" instructions must be 0x3F180000 - This is a simple "do nothing" instruction that passes the input to the output with no operations performed. 

The current design is still a work in progress and is continually being updated. The goal for the implemented image processor is as follows: 
- 16 PLUs are used in parallel to form a single image processing core
- All 16 PLUs perform the same instruction
- Multiple image processing cores can be combined in parallel for faster operation. 
- Current FPGA implementations on an Artix 7 35T (-1 speed grade) result in 350 logic elements per PLU with a maximum clock speed of 166Mhz
- The final design will implement two cores with a theoretical pixel throughput of: (32-pixel cores x 166Mhz/Core)/(2 cycles x 1 instruction) = 2.656G pixels/s down to (32 x 166)/(2 cycles x 16 instructions) = 166M pixels/s (This is most likely to decrease with additional overhead, memory bandwidth, video bandwidth, etc. So take it with a baseball-sized grain of salt) 

**TODO:**

- Implement pipelined design to improve performance
- Re-design processor using custom Integer RGB-HSV and HSV-RGB converters (ENORMOUS improvement in capabilities from this)
- Add custom instruction decode and control data path for easier programming
- Reduce instruction set
- Design Pixel distributor to run multiple PLUs in parallel 

**Future Revisions:**

Revision 3 of the PLU is currently being developed. This revision will include a significant architectural change. Currently, the PLU's ALU's cannot operate on each other's output. They can only operate on their own output. Additionally, input B cannot be set to input A. Revision 3 solves these limitations by adding a two-stage mux. The first MUX stage allows for any combination of data input to be sent to inputs A and B of the ALU's. This provides the ability to copy over the incoming Pixel data into the B register for use in later operations. The second MUX stage allows for any color channel to be sent to any ALU. This allows for operations such as R + G + B, R * G + B etc. to be performed on any given pixel. These new instructions provide the ability to do full contrast and vibrance operations. 

Branching has not yet been implemented and may not be implemented at all. The purpose of these cores are to be very fast and lightweight. Adding Branching will significantly increase the complexity and can substantially lower the processing speed. Currently, 2 cycles are needed per operation. However, 3 instructions can be performed in parallel per PLU, vastly reducing the required program size and number of steps. 

**Example Outputs:**

The following output is a result of OR'ing the pixels with some control data and subsequently XOR'ing them with new control data

**Original Image:**

![Original Image](https://imgur.com/zCOxktV.png)

**Processed Image:**

![Processed Image](https://imgur.com/xH47eJf.png)
