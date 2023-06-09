# PLU
Pixel Logic Unit simulation used to simple image processing applications.

This image processor was designed in Logisim Evolution and is intended for implementation on the ArtixDuo FPGA board.

A sample image png has been provided along with its Hex file generated using my PNG to Hex python script. The two files are titled "Contrast"

The processor architecture is relatively simple, consisting of three 8-bit integer ALU's (one for each color channel). Each ALU can perform Add, Subtract, Multiply, Divide, Bit shift, AND, OR, NOT, NOR, NAND, XOR, XNOR, Passthrough A, Passthrough B, output all 1's, output all 0's.

A 32-bit instruction word is used allowing each ALU to perform a unique operation. Each ALU has two inputs A and B. Input A is designated for the pixel color data to be processed, input B is a control data input used to perform operations on the pixel data and can be any 8-bit data input. 

The PLU can perform one operation per clock cycle. A minimum of 3 clock cycles are needed for the current configuration due to the registered inputs and outputs. This can be changed by removing the input/output registers allowing for single clock cycle operation. 

The input/output registers allow for multiple operations to be performed per pixel. The current design supports up to 16 operations per pixel. An excel file has been created to assemble 32-bit hex instructions that can be loaded into the instruction ROM. The PNG-To-HEX project can be used to generate hex files that can be loaded into the image ROM. The visual basic functions used in the excel file have also been provided. Macros are required for the excel file to work (A proper C assembler will be developed once the PLU architecture is finalized)

Logisim Usage: 
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

TODO: 
- Reduce Logic size and increase clock speed. Target is 200Mhz
- Re-build using Vivado IP cores (experimentational, looking to see if there are any improvements)
- Design Pixel distributor to run multiple PLU's in parallel 

Example Outputs:
The following output is a result of OR'ing the pixels with some control data and subsequently XOR'ing them with new control data

![Original Image](https://imgur.com/zCOxktV.png)

![Processed Image](https://imgur.com/xH47eJf.png)
