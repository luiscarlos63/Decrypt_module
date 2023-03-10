`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2023 05:34:24 PM
// Design Name: 
// Module Name: rom_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module rom_mem (
	a,
	rd
);
	input wire [12:0] a;
	output wire [127:0] rd;
	reg [127:0] RAM [63:0];
	initial $readmemh("/home/luiscarlos/Desktop/ultra/ultra96_ptl/ultra96v2-vitis-pkg/vivado3/Decrypt/Hardware/Decrypt_module/src/scripts/rom_init.txt", RAM);
	assign rd = RAM[a];
endmodule
