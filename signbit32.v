`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2024 18:30:26
// Design Name: 
// Module Name: signbit32
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


module signbit32(a, b, p);
input [31:0]a,b;
reg [63:0]m[31:0];
wire [63:0]s [31:0];
output [63:0]p;

genvar i,j;
generate
    for(i=0; i<32; i = i+1) begin: LOOP_A
        for(j=0; j<64; j = j+1) begin: LOOP_B
            always @* begin
                if (i > j) begin
                    m[i][j] = 0;
                end
        
                else if (j-i>=32) begin
                    m[i][j] = m[i][j-1];
                end
                
                else begin
                        m[i][j] = a[j-i] & b[i];
                end        
            end
        end
    end    
    for(i=0; i<31; i = i+1) begin: LOOP_C
         if (i == 0) 
               assign s[i] = m[0];
           else
               assign s[i] = s[i - 1] + (m[i]);
        
    end
            
endgenerate

assign p = s[30] + ((~m[31]+1));
endmodule

