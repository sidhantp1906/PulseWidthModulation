`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:40 05/26/2021 
// Design Name: 
// Module Name:    pw 
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
module pw(
    input [9:0]duty,
    input [14:0]finalv,
    input clk,
    input reset,
	 input enable,
    output pwmout
    );

	 
wire tick;
reg [7:0]qreg,qnext;
reg dreg , dnext;

timer tu(.clk(clk),.reset(reset),.enable(enable),.finalv(finalv),.done(tick));

always @(posedge clk)
begin 
if(reset)
begin
qreg <= 1'b0;
dreg <= 1'b0;
end
else if(tick)
begin
qreg <= qnext;
dreg <= dnext;
end
else
begin
qreg <= qreg;
dreg <= dreg;
end
end

always @(qreg or duty)
begin
qnext = qreg +1;
dnext = (qreg < duty);
end

assign pwmout = dreg;
 

endmodule
 



