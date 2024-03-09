`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2024 11:31:56
// Design Name: 
// Module Name: CLOCK_DIVIDER
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


module CLOCK_DIVIDER(clk, rst,div2,div4,div8,div16);
input clk,rst;

reg [3:0] count;

output reg div2,div4,div8,div16;
always @(posedge clk or negedge rst) begin
    if (~rst) begin
        count <= 4'b0000;
        div2 <= 1'b0;
        div4 <= 1'b0;
        div8 <= 1'b0;
        div16 <= 1'b0;
    end
    else begin
        count <= count + 1;
        div2 <= count[0];
        div4 <= count[1];
        div8 <= count[2];
        div16 <= count[3];
    end
end

endmodule