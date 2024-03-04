`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2024 18:24:11
// Design Name: 
// Module Name: dit_fft_8
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


module dit_fft_8( clk,sel,y_real,y_img );

    input clk;
    input [2:0] sel;
    output reg [8:0] y_real,y_img;
    
    wire [8:0] y0r,y1r,y2r,y3r,y4r,y5r,y6r,y7r,y0i,y1i,y2i,y3i,y4i,y5i,y6i,y7i;
    wire [8:0] x20r,x20i,x21r,x21i,x22r,x22i,x23r,x23i,x24r,x24i,x25r,x25i,x26r,x26i,x27r,x27i;
    wire [8:0] x10r,x10i,x11r,x11i,x12r,x12i,x13r,x13i,x14r,x14i,x15r,x15i,x16r,x16i,x17r,x17i;
    wire [8:0] x0,x1,x2,x3,x4,x5,x6,x7;
    
    parameter w0r=9'b1;
    parameter w0i=9'b0;
    parameter w1r=9'b010110101; //0.707 = 0.10110101
    parameter w1i=9'b101001011; //-0.707 = 1.01001011
    parameter w2r=9'b0;
    parameter w2i=9'b111111111; // -1
    parameter w3r=9'b101001011; //-0.707 = 1.01001011
    parameter w3i=9'b101001011; //-0.707 = 1.01001011
        
    //feed input
    assign x0=9'b1; //1
    assign x1=9'b10;    //2
    assign x2=9'b100;   //4
    assign x3=9'b1000;  //8
    assign x4=9'b10000; //16
    assign x5=9'b100000;    //32
    assign x6=9'b1000000;   //64
    assign x7=9'b10000000;  //128
    
    //stage1
    bfly2_4 s11(x0,x4,w0r,w0i,x10r,x10i,x11r,x11i);
    bfly2_4 s12(x2,x6,w0r,w0i,x12r,x12i,x13r,x13i);
    bfly2_4 s13(x1,x5,w0r,w0i,x14r,x14i,x15r,x15i);
    bfly2_4 s14(x3,x7,w0r,w0i,x16r,x16i,x17r,x17i);
    
    //stage2
    bfly2_4 s21(x10r,x12r,w0r,w0i,x20r,x20i,x22r,x22i);
    bfly2_4 s22(x11r,x13r,w2r,w2i,x21r,x21i,x23r,x23i);
    bfly2_4 s23(x14r,x16r,w0r,w0i,x24r,x24i,x26r,x26i);
    bfly2_4 s24(x15r,x17r,w2r,w2i,x25r,x25i,x27r,x27i);
    
    //stage3
    bfly2_4 s31(x20r,x24r,w0r,w0i,y0r,y0i,y4r,y4i);
    bfly4_4 s32(x21r,x21i,x25r,x25i,w1r,w1i,y1r,y1i,y5r,y5i);
    bfly2_4 s33(x22r,x26r,w2r,w2i,y2r,y2i,y6r,y6i);
    bfly4_4 s34(x23r,x23i,x27r,x27i,w3r,w3i,y3r,y3i,y7r,y7i);
    
    always@(posedge clk)
         case(sel)
       0:begin y_real = y0r; y_img = y0i; end
       1:begin y_real = y1r; y_img = y1i; end
       2:begin y_real = y2r; y_img = y2i; end
       3:begin y_real = y3r; y_img = y3i; end
       4:begin y_real = y4r; y_img = y4i; end
       5:begin y_real = y5r; y_img = y5i; end
       6:begin y_real = y6r; y_img = y6i; end
       7:begin y_real = y7r; y_img = y7i; end
      endcase
  
endmodule
