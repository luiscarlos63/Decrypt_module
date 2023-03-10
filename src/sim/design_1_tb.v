`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2023 05:01:27 PM
// Design Name: 
// Module Name: design_1_tb
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


module design_1_tb(
    );
    
parameter clock_period = 10;
    
design_1_wrapper decrypt(
    .bit_addr_0 (bit_addr_0),
    .bit_size_0 (bit_size_0),
    .done_0     (done_0),
    .reset_rtl  (reset_rtl),
    .sys_clock  (sys_clock),
    .trigger_0  (trigger_0)
    );

  reg [12:0]bit_addr_0 = 13'h0;
  reg [12:0]bit_size_0 = 13'h4;
  
  wire done_0;
  reg reset_rtl;
  reg sys_clock;
  reg trigger_0;    
    
    
always #(clock_period/2) sys_clock <= ~sys_clock;
    
    
    
initial begin

sys_clock = 0;
reset_rtl = 0;
trigger_0 = 0;
bit_addr_0 = 13'h0;
bit_size_0 = 13'h3;
//reset
#(2 * clock_period)
    reset_rtl = 1;
    
//avança para Init
#(2 * clock_period)
    reset_rtl = 0;

//avança para Start
#(2*clock_period)
    trigger_0 = 1;
#(20*clock_period)
    trigger_0 = 0;
    
    




end
    
    
    
endmodule
