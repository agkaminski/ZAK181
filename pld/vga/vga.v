`timescale 1ns / 1ps

module vga (
	input pclk,
	input rst_n,

	// MCU interface
	input [13:0] addr,
	inout [7:0] data,
	input cs_n,
	input wr_n,
	input rd_n,
	output reg irq_n,
	input irqack_n,
	input [5:0] scroll,

	// VRAM
	output [13:0] vaddr,
	inout [7:0] vdata,
	output vrd_n,
	output vwr_n,

	// VGA control
	output reg blank,
	output reg hsync_n,
	output reg vsync_n,
	output reg shload_n,
	output pload_n,
	output cload_n,
	output [2:0] crow
);

reg [9:0] col_i;
reg [9:0] row_i;

// counters
always @(posedge pclk, negedge rst_n) begin
	if (~rst_n) begin
		col_i <= 0;
		row_i <= 0;
	end else begin
		col_i <= col_i + 1;
		if (col_i == 799) begin
			col_i <= 0;
			row_i <= row_i + 1;
			if (row_i == 524)
				row_i <= 0;
		end
	end
end

// column counter delay
reg [9:2] col_b;

always @(posedge pclk, negedge rst_n) begin
	if (~rst_n)
		col_b[9:2] <= 8'b0;
	else
		col_b[9:2] <= col_i[9:2];
end

// blanking
reg hblank;
reg vblank;

always @(posedge pclk, negedge rst_n) begin
	if (~rst_n)
		vblank <= 1;
	else begin
		if (row_i >= 480)
			vblank <= 1;
		else
			vblank <= 0;
	end
end

always @(posedge pclk, negedge rst_n) begin
	if (~rst_n)
		hblank <= 1;
	else begin
		if (col_i < (8 - 2) || col_i >= (640 - 2 + 8))
			hblank <= 1;
		else
			hblank <= 0;
	end
end

always @(posedge pclk, negedge rst_n) begin
	if (~rst_n) begin
		blank <= 1;
	end else begin
		blank <= hblank || vblank;
	end
end

// interrupt
wire irq_reset;

assign irq_reset = ~rst_n || ~irqack_n;
always @(posedge vblank, posedge irq_reset) begin
	if (irq_reset)
		irq_n <= 1;
	else
		irq_n <= 0;
end

// hsync
reg hsync_i;

always @(posedge pclk, negedge rst_n) begin
	if (~rst_n) begin
		hsync_i <= 0;
		hsync_n <= 0;
	end else begin
		if (col_i >= (640 + 16 + 8 - 1) && col_i < (640 + 16 + 8 + 96 - 1))
			hsync_i <= 1;
		else
			hsync_i <= 0;

		hsync_n <= ~hsync_i;
	end
end

// vsync
reg vsync_i;

always @(posedge pclk, negedge rst_n) begin
	if (~rst_n) begin
		vsync_i <= 0;
		vsync_n <= 0;
	end else begin
		if (row_i >= (480 + 10) && row_i < (480 + 10 + 2))
			vsync_i <= 1;
		else
			vsync_i <= 0;

		vsync_n <= ~vsync_i;
	end
end

// registers load
wire color;

always @(posedge pclk, negedge rst_n) begin
	if (~rst_n)
		shload_n <= 1;
	else begin
		if (col_i[2:0] == 3'b111)
			shload_n <= 0;
		else
			shload_n <= 1;
	end
end

assign color = col_b[2];
assign pload_n = color;
assign cload_n = shload_n;

// character generator
assign crow = row_i[2:0];

// VRAM and MCU interface
assign vwr_n = (~cs_n && ~wr_n) ? 1'b0 : 1'b1;
assign vrd_n = ~vwr_n;
assign vdata = (~cs_n && ~wr_n) ? data : 8'bz;
assign data = (~cs_n && ~rd_n) ? vdata : 8'bz;

wire [5:0] row_added;

assign row_added = row_i[8:3] + scroll;
assign vaddr = ~cs_n ? addr : { color, row_added, col_b[9:3] };

endmodule
