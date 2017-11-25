`timescale 1ns / 1ps
module alu_v(
	 input wire clk,
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [2:0] CtrlFunc,
    output wire [31:0] Result,
    output wire [3:0] Flags
	 );

reg [31:0]CMPtemp;
reg [31:0] Result_temp;
reg [3:0] Flags_temp;


always@(posedge clk) begin
if(CtrlFunc == 3'b000) //AND
	Result_temp <= A & B;
	
else if(CtrlFunc == 3'b101) //OR
	Result_temp <= A | B;
	
else if(CtrlFunc == 3'b011)//ADD
	Result_temp <= A + B;

else if(CtrlFunc == 3'b001) //XOR
	Result_temp <= A ^ B;
	
else if(CtrlFunc == 3'b010) //SUB
	Result_temp <= A - B;

else if(CtrlFunc == 3'b110) //MUL
	Result_temp <= A * B;

else if(CtrlFunc == 3'b100) //CMP
	begin
		CMPtemp <= A - B;
		if(CMPtemp == 32'd0)
			begin
				Result_temp <= A;
			end
		else
			begin
				Result_temp <= A - B;
			end
	end
end

always @(negedge clk)     //para simular	(Result), para placa (negedge clk)			     //flags  [N,Z,C,V]
begin
	if(Result == 32'd0)
		Flags_temp <= 4'b0100;

	else if(Result < 0)
		Flags_temp <= 4'b1000;
		
	else if(Result > 0)
		Flags_temp <= 4'b0000;
end

assign Flags = Flags_temp;
assign Result = Result_temp;

endmodule