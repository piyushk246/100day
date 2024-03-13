`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2024 00:16:07
// Design Name: 
// Module Name: C_rot
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

//#(parameter N = 15)

module doubly_pipeline #(parameter N = 31) (

        input signed [N:0] a,
        input signed [N:0] b,
        input signed [N:0] p,
        input signed [N:0] q,
        //input [15:0] inangle,
        input clk,
        input rst,
//        output reg  signed  [N:0] af,
        output  reg signed  [N:0] qf,
//        output reg  signed  [N:0] bf,
        output  reg signed  [N:0] pf,
        //output  signed [N:0] afcal,
        //output  signed [N:0] bfcal,
        output reg [15:0]  output_angle
        
    );
   
    
    wire  [3:0] shift;
    wire  [15:0] microangle;
    wire  signed [N:0] a0,ax1,ax2,ax3,ax4,ax5,ax6,ax7,ax8,ax9,ax10,ax11,ax12 ;
    wire  signed [N:0] b0,by1,by2,by3,by4,by5,by6,by7,by8,by9,by10,by11,by12 ;
    wire  signed [N:0] p0,px1,px2,px3,px4,px5,px6,px7,px8,px9,px10,px11,px12 ;
    wire  signed [N:0] q0,qy1,qy2,qy3,qy4,qy5,qy6,qy7,qy8,qy9,qy10,qy11,qy12 ;
    wire  [15:0] outangle0 ,outangle1 ,outangle2 ,outangle3 ,outangle4 ,outangle5 ,outangle6 ,outangle7, outangle8,outangle9,outangle10,outangle11;
    wire  [15:0] outangle12 ;
    wire  [15:0] dec_angle;
    reg  [15:0] output_angle_it=0;

    
    
    iteration Rot0( .a(a) , .b(b) , .p(p) , .q(q)      ,.shift(4'd0),  .dec_angle(16'h0)     , .microangle(16'h2d00),   .clk(clk), .ax(a0),.by(b0), .px(p0),.qy(q0), .outangle(outangle0) );
    
    
   
    iteration Rot1( .a(a0), .b(b0),   .p(p0) , .q(q0) , .shift(4'd1),  .dec_angle(outangle0) , .microangle( 16'h1a_92 ), .clk(clk), .ax(ax1),.by(by1), .px(px1),.qy(qy1), .outangle(outangle1));
    
    iteration Rot2( .a(ax1), .b(by1), .p(px1) , .q(qy1) , .shift(4'd2),  .dec_angle(outangle1) , .microangle( 16'h0e_0a ), .clk(clk), .ax(ax2),.by(by2),.px(px2),.qy(qy2), .outangle(outangle2));
     
    iteration Rot3( .a(ax2) ,.b(by2), .p(px2) , .q(qy2) , .shift(4'd3),  .dec_angle(outangle2) , .microangle(16'h07_21 ),  .clk(clk), .ax(ax3),.by(by3),.px(px3),.qy(qy3), .outangle(outangle3));
    
    iteration Rot4( .a(ax3), .b(by3), .p(px3) , .q(qy3) , .shift(4'd4),  .dec_angle(outangle3) , .microangle( 16'h03_94 ), .clk(clk), .ax(ax4),.by(by4),.px(px4),.qy(qy4), .outangle(outangle4));
    
    iteration Rot5( .a(ax4), .b(by4), .p(px4) , .q(qy4) , .shift(4'd5),   .dec_angle(outangle4) , .microangle( 16'h01_ca ), .clk(clk), .ax(ax5),.by(by5),.px(px5),.qy(qy5), .outangle(outangle5));
    
    iteration Rot6( .a(ax5), .b(by5), .p(px5) , .q(qy5) , .shift(4'd6),  .dec_angle(outangle5) , .microangle( 16'h00_e4 ), .clk(clk), .ax(ax6),.by(by6),.px(px6),.qy(qy6), .outangle(outangle6));
    
    iteration Rot7( .a(ax6), .b(by6), .p(px6) , .q(qy6) , .shift(4'd7),   .dec_angle(outangle6) , .microangle( 16'h00_71 ), .clk(clk), .ax(ax7),.by(by7),.px(px7),.qy(qy7),.outangle(outangle7));
    
    iteration Rot8( .a(ax7),  .b(by7),  .p(px7) , .q(qy7) , .shift(4'd8),    .dec_angle(outangle7)  , .microangle( 16'h00_38 ), .clk(clk), .ax(ax8), .by(by8), .px(px8),.qy(qy8),  .outangle(outangle8));
     
    iteration Rot9( .a(ax8),  .b(by8),  .p(px8) , .q(qy8) , .shift(4'd9),    .dec_angle(outangle8)  , .microangle( 16'h00_1c ), .clk(clk), .ax(ax9), .by(by9), .px(px9),.qy(qy9),  .outangle(outangle9));
     
    iteration Rot10( .a(ax9),  .b(by9),  .p(px9) , .q(qy9) , .shift(4'd10),   .dec_angle(outangle9)  , .microangle( 16'h00_0d ), .clk(clk), .ax(ax10), .by(by10), .px(px10),.qy(qy10), .outangle(outangle10));
    
   iteration Rot11( .a(ax10), .b(by10), .p(px10) , .q(qy10) , .shift(4'd11),  .dec_angle(outangle10) , .microangle( 16'h00_05 ), .clk(clk), .ax(ax11), .by(by11), .px(px11),.qy(qy11), .outangle(outangle11));
    
   iteration Rot12( .a(ax11), .b(by11), .p(px11) , .q(qy11) , .shift(4'd12),  .dec_angle(outangle11) , .microangle( 16'h00_03 ), .clk(clk), .ax(ax12), .by(by12), .px(px12),.qy(qy12), .outangle(outangle12));
    
    
    
//    iteration Rot13( .a(ax12), .b(by12), .shift(4'd13), .inangle(inangle), .dec_angle(outangle12) , .microangle( 16'd00_89 ), .clk(clk), .ax(ax13),.by(by13), .outangle(outangle13));
    
//    iteration Rot14( .a(ax13), .b(by13), .shift(4'd14), .inangle(inangle), .dec_angle(outangle13) , .microangle( 16'd00_44 ), .clk(clk), .ax(ax14),.by(by14), .outangle(outangle14));
    
        
//    iteration Rot15( .a(ax14), .b(by14), .shift(4'd15), .inangle(inangle), .dec_angle(outangle14) , .microangle( 16'd00_44 ), .clk(clk), .ax(ax15),.by(by15), .outangle(outangle15));
    
    
    
//   assign output_angle = outangle12;
    
    
//  assign af = (0.607)*ax12;
//  assign bf = (0.607)*by12;

       
//  assign pf = (0.607)*px12;
//  assign qf = (0.607)*qy12;

    
 always @(clk) begin
     if (!rst ) begin // Reset outputs to zero until ready
//         af <= 0;
//         bf <= 0;
         pf <= 0;
         qf <= 0;
         output_angle <= 0;
     end 
     else if (a== 0 || b ==0) begin
        pf <= p;
        qf <= q;
     end
     
     else 
     begin // Output valid results when ready
//         af <= (ax12 >>> 1) + (ax12 >>> 3) + (ax12 >>> 6) - (ax12 >>> 5) - (ax12 >>> 9);
//         bf <= (by12 >>>1) +  (by12 >>> 3) +  (by12 >>> 6) -  (by12 >>> 5) - (by12 >>>9);
         pf <= (px12 >>> 1) + (px12 >>> 3) +  (px12 >>> 6) - (px12 >>> 5) - (px12 >>> 9);
         qf <= (qy12 >>>1) +  (qy12 >>> 3) +  (qy12 >>> 6) -  (qy12 >>> 5) - (qy12 >>>9);
         output_angle <= outangle12;
     end
end


//   assign af = (ax12 >>> 1) + (ax12 >>> 3) + (ax12 >>> 6) - (ax12 >>> 5) - (ax12 >>> 9);
   
    
//   assign bf = (by12 >>>1) +  (by12 >>>3) +  (by12 >>>6) -  (by12 >>> 5) - (by12 >>>9);

//assign af = afr;
//assign bf = bfr;
//assign output_angle = outangle12;
    
    
    
    
endmodule

