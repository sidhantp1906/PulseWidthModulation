`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:39:23 07/24/2021 
// Design Name: 
// Module Name:    timer 
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
module timer(input clk,reset,enable,input [14:0]finalv,output done);

reg [7:0]qreg,qnext;

always @(posedge clk)
begin
if(reset)
qreg <= 1'b0;
else if(enable)
qreg <= qnext;
else
qreg <= qreg;
end



assign done = (qreg == finalv);


always @(done or qreg)
begin
 qnext = (done)?1'b0:qreg+1;
end


endmodule
