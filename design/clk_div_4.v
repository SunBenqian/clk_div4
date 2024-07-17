
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : 孙本千 382126027@qq.com
// File   : clk_div_4.v
// Create : 2023-08-09 14:40:37
// Revise : 2023-08-09 15:35:49
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------

module clk_div_4 (
	input	wire		clk,
	input 	wire		rst,
	output 	reg			clk_4
	);


reg 	[1:0]	cnt;


//养成一个习惯就是一个always生成一个波形
//生成计数器0~3的一个计数器
always @(posedge clk)
begin
	if (rst == 1'b1)
		cnt <= 'd0;
	else 
	begin
		if (cnt == 2'd3)
			cnt <= 'd0;
		else 
			cnt <= cnt + 1'b1;
	end
end

//生成分频时钟的always块

always @ (posedge clk)
begin
	if (rst == 1)
		clk_4 <= 0;
	else 
	begin
		case (cnt)
		1:	clk_4 <= 1;
		3:	clk_4 <= 0;
		default: clk_4 <= clk_4;
		endcase
	end
end

endmodule 