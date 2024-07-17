
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : 孙本千 382126027@qq.com
// File   : clk_div_4_2.v
// Create : 2023-08-09 14:40:37
// Revise : 2023-08-12 09:30:55
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------

module clk_div_4_2 (
	input	wire			clk,
	input 	wire			rst,
	output 	reg		[1:0]	po_cnt = 2'd0
	);


reg 	[1:0]	cnt;
reg				div_flag;

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

//生成div_flag的always块

always @ (posedge clk)
begin
	if (rst == 1'b1)
		div_flag <= 1'b0;
	else 
	begin
		if (cnt == 2'd1)
		begin
			div_flag <= 1'b1;
		end
		else 
		begin
			div_flag <= 1'b0;
		end
	end
end

//利用div_flag来得到po_cnt

always @(posedge clk)
begin
	if (rst == 1'b1)
		begin
			po_cnt <= 2'd0;
		end
	else 
	begin
		if(div_flag == 1'b1)
		begin
			po_cnt <= po_cnt + 1'b1;
		end
	end
end
endmodule 