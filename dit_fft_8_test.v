`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2024 18:26:22
// Design Name: 
// Module Name: dit_fft_8_test
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


module dit_fft_8_test();

   // Parameters
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Signals
    reg clk;
    reg [2:0] sel;
    wire [8:0] yr, yi;

    // Instantiate the module under test
    dit_fft_8 dut (
        .clk(clk),
        .sel(sel),
        .y_real(yr),
        .y_img(yi)
    );

    // Clock generation
    always begin
        #(CLK_PERIOD/2) clk = ~clk;
    end

    // Stimulus
    initial begin
        clk = 0;
        sel = 0;
        
        #100; // Initial delay
        
        // Test case
        sel = 0;
        #100;
        
        sel = 1;
        #100;
        
        sel = 2;
        #100;
        
        sel = 3;
        #100;
        
        sel = 4;
        #100;
        
        sel = 5;
        #100;
        
        sel = 6;
        #100;
        
        sel = 7;
        #100;
        
        // End simulation
        $finish;
    end
endmodule
