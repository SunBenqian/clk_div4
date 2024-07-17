
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : 孙本千 382126027@qq.com
// File   : tb_clk_div_4_2.v
// Create : 2023-08-09 14:53:40
// Revise : 2023-08-09 17:56:14
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------

`timescale	1ns/1ns

module tb_clk_div_4_2 ();

reg		clk;
reg 	rst;
wire 	po_cnt;

initial 
begin
	clk = 0;
end

always #10	clk = ~clk;

initial 
begin
	rst = 1;
	#50

	rst = 0;
end

clk_div_4_2  i1 (
	.clk(clk),
	.rst(rst),
	.po_cnt(po_cnt)
	);

endmodule 