`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2024 02:21:37
// Design Name: 
// Module Name: tbm
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

module tbm();
reg [31:0] A,B;
wire [63:0] R;

signbit32 mm1(.a(A), .b(B), .p(R));
initial
begin
A = 12;

B = -4;

#50;
A = -3; B = -4;  
end
endmodule
