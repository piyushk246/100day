`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2024 00:18:50
// Design Name: 
// Module Name: Cordic_rotation_tb
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


`timescale 1ns / 1ps

module doubly_pipeline_tb;
 parameter N =31;   
  reg  signed [N :0] a,p;
  reg  signed [N :0] b,q;
  reg clk;
  reg rst;
//  wire signed [N:0] af;
  wire signed [N:0] pf;
//  wire signed [N:0] bf;
  wire signed [N:0] qf;
  wire [15:0] output_angle;

  // Instantiate the Cordic_rotation module
  doubly_pipeline uut(
    .a(a),
    .b(b),
    .p(p),
    .q(q),
    
    .clk(clk),
    .rst(rst),
//    .af(af),
//    .bf(bf),
    .pf(pf),
    .qf(qf),

    .output_angle(output_angle)
    
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Apply stimulus
  initial begin
  rst =0 ;
    // Initialize inputs
    a = 32'h00000400;
    b = 32'h00000300;
    
    p = 32'h00000300;
    q = 32'h00000400;
    //inangle = 16'd70_95;
    #130      // set clock
    
   rst =1;
    
    
    #200;
    $finish;
  end


endmodule

