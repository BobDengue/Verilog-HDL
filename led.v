`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:23:29 03/29/2017 
// Design Name: 
// Module Name:    led 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module led(
	clk ,
	rst_n ,
	led ,
    );
	 
//input declaration
 input clk ;
 input rst_n ;
 output [3:0] led ;
 
 //register declaration
 reg [31:0] timer ;
 reg [3:0] led ;
 
 //code start here 
 
 //timer count 4 second
 always @(posedge clk or negedge rst_n)
	begin
		if(~rst_n)
			timer <= 0 ;
		else if(timer==32'd199_999_999)
			timer <= 0 ;
		else 
			timer <= timer + 1'b1 ;
	end

//Led controll
always @(posedge clk or negedge clk)
	begin
		if(~rst_n)
			led <= 4'b1111 ;
		else if(timer==32'd49_999_999)
			led <= 4'b1110 ;
		else if(timer==32'd99_999_999)
			led <= 4'b1101 ;
		else if(timer==32'd149_999_999)
			led <= 4'b1011 ;
		else if(timer==32'd199_999_999)
			led <= 4'b0111 ;
	end
endmodule
