
// -----------------------------------------------------------------------------
// Copyright (c) 2014-2023 All rights reserved
// -----------------------------------------------------------------------------
// Author : 孙本千 382126027@qq.com
// File   : tb_clk_div_4.v
// Create : 2023-08-09 14:53:40
// Revise : 2023-08-09 14:57:12
// Editor : sublime text4, tab size (4)
// -----------------------------------------------------------------------------

`timescale	1ns/1ns

module tb_clk_div_4 ();

reg		clk;
reg 	rst;
wire 	clk_4;

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

clk_div_4  i1 (
	.clk(clk),
	.rst(rst),
	.clk_4(clk_4)
	);

endmodule 