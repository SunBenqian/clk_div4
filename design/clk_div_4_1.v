
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : 孙本千 382126027@qq.com
// File   : clk_div_4_1.v
// Create : 2023-08-09 14:40:37
// Revise : 2023-08-09 17:30:28
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------

module clk_div_4_1 (
	input	wire			clk,
	input 	wire			rst,
	output 	reg		[1:0]	po_cnt = 2'd0
	);


reg 	[1:0]	cnt;
reg				clk_4;

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
		if (cnt == 2'd1)
		begin
			clk_4 <= 1'b1;
		end
		else if(cnt == 2'd3)
		begin
			clk_4 <= 1'b0;
		end
	end
end

//利用分频得到的clk_4得到分频计数器

always @(posedge clk_4)
begin
	if (rst == 1'b1)
		begin
			po_cnt <= 2'd0;
		end
	else 
	begin
		if (po_cnt == 2'd3)
			begin
				po_cnt <= 2'd0;
			end
		else 
		begin
			po_cnt <= po_cnt + 1'b1;
		end
	end
end
endmodule 