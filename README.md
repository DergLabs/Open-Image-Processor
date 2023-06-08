# PLU
Pixel Logic Unit simulation used to simple image processing applications

This image processor was designed in Logisim Evolution and is intended for implementation on the ArtixDuo FPGA board

The proessor architecture is relatively simple, consisting of three 8-bit integer ALU's (one for each color channel). Each ALU can perform Add, Subtract, Multiply, Divide, Bit shift, AND, OR, NOT, NOR, NAND, XOR, XNOR, Passthrough A, Passthrough B, output all 1's, output all 0's.

A 32-bit instruction word is used allowing each ALU to perform a unique operation. Each ALU has two inputs A and B. Input A is designated for the pixel color data to be processed, input B is a control data input used to perform operations on the pixel data and can be any 8-bit data input. 

The PLU can perform one operation per clock cycle. A minimum of 3 clock cycles are needed for the current configuration due to the registered inputs and outputs. This can be changed by removing the input/output registers allowing for single clock cycle operation. 

The input/output registers allow for muliple operations to be performed per pixel. The current design supports upto 16 operations per pixel. An excel file has been created to assemble 32-bit hex instructions that can be loaded into the instruction ROM. The PNG-To-HEX project can be used to generate hex files that can be loaded into the image ROM. The visual basic functions used in the excel file have also been provided.

The current design is still a work in progress and is continually being updated. The goal for the implemented image processor is as follows: 
- 16 PLU's are used in parallel to form a singe image processing core
- All 16 PLU's perform the same instruction
- Multiple image processing cores can be combined in parallel for faster operation. 
- Current FPGA implementations on an Artix 7 35T (-1 speed grade) result in 350 logic elements per PLU with a maximum clock speed of 166MHz
