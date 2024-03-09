`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2024 11:32:20
// Design Name: 
// Module Name: CLOCK_DIVIDER_TB
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


module CLOCK_DIVIDER_TB;

reg clk, rst;
wire div2, div4, div8, div16;

CLOCK_DIVIDER dut (
    .clk(clk),
    .rst(rst),
    .div2(div2),
    .div4(div4),
    .div8(div8),
    .div16(div16)
);

initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    // Apply reset for a few clock cycles
    #10 rst = 0;
    #20 rst = 1;
end
    // Toggle clock for 100 cycles
    initial  begin
        #5 clk = ~clk;
    end

always #1 clk = ~clk;

endmodule
