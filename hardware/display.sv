/*
 * Avalon memory-mapped peripheral that generates VGA
 *
 * Stephen A. Edwards
 * Columbia University
 *
 * Register map:
 * 
 * Byte Offset  30 ... 0   Meaning
 *        0    |  ball 1 x 
 *        1    |  ball 1 y 
 *        2    |  ball 1 size
 *        3    |  ball 2 x 
 *        4    |  ball 2 y 
 *        5    |  ball 2 size
 *        6    |  ball 3 x 
 *        7    |  ball 3 y 
 *        8    |  ball 3 size
 *        9    |  ball 4 x 
 *       10    |  ball 4 y 
 *       11    |  ball 4 size
 *       12    |  ball 5 x 
 *       13    |  ball 5 y 
 *       14    |  ball 5 size
 *       15    |  ball 6 x 
 *       16    |  ball 6 y 
 *       17    |  ball 6 size
 *       18    |  ball 7 x 
 *       19    |  ball 7 y 
 *       20    |  ball 7 size
 *       21    |  ball 8 x 
 *       22    |  ball 8 y 
 *       23    |  ball 8 size
 *       24    |  ball 9 x 
 *       25    |  ball 9 y 
 *       26    |  ball 9 size
 *       27    |  ball 10 x 
 *       28    |  ball 10 y 
 *       29    |  ball 10 size


 */

module vga_ball(input logic        clk,
	        input logic 	   reset,
		input logic [16:0]  writedata,
		input logic 	   write,
		input 		   chipselect,
		input logic [4:0]  address,

		output logic [7:0] VGA_R, VGA_G, VGA_B,
		output logic 	   VGA_CLK, VGA_HS, VGA_VS,
		                   VGA_BLANK_n,
		output logic 	   VGA_SYNC_n);

   logic [10:0]	   hcount;
   logic [9:0]     vcount;

    logic signed  [31:0]	   x1_diff;
    logic signed  [31:0]    y1_diff;
    logic signed  [31:0]    x1_squared;
    logic signed  [31:0]    y1_squared;

    logic signed  [31:0]	   x2_diff;
    logic signed  [31:0]    y2_diff;
    logic signed  [31:0]    x2_squared;
    logic signed  [31:0]    y2_squared;

    logic signed  [31:0]	   x3_diff;
    logic signed  [31:0]    y3_diff;
    logic signed  [31:0]    x3_squared;
    logic signed  [31:0]    y3_squared;

    logic signed  [31:0]	   x4_diff;
    logic signed  [31:0]    y4_diff;
    logic signed  [31:0]    x4_squared;
    logic signed  [31:0]    y4_squared;

    logic signed  [31:0]	   x5_diff;
    logic signed  [31:0]    y5_diff;
    logic signed  [31:0]    x5_squared;
    logic signed  [31:0]    y5_squared;

    logic signed  [31:0]	   x6_diff;
    logic signed  [31:0]    y6_diff;
    logic signed  [31:0]    x6_squared;
    logic signed  [31:0]    y6_squared;

    logic signed  [31:0]	   x7_diff;
    logic signed  [31:0]    y7_diff;
    logic signed  [31:0]    x7_squared;
    logic signed  [31:0]    y7_squared;

    logic signed  [31:0]	   x8_diff;
    logic signed  [31:0]    y8_diff;
    logic signed  [31:0]    x8_squared;
    logic signed  [31:0]    y8_squared;

    logic signed  [31:0]	   x9_diff;
    logic signed  [31:0]    y9_diff;
    logic signed  [31:0]    x9_squared;
    logic signed  [31:0]    y9_squared;

    logic signed  [31:0]	   x10_diff;
    logic signed  [31:0]    y10_diff;
    logic signed  [31:0]    x10_squared;
    logic signed  [31:0]    y10_squared;

    logic [15:0] x1_live, y1_live, size1_live;
    logic [15:0] x1, y1, size1;

    logic [15:0] x2_live, y2_live, size2_live;
    logic [15:0] x2, y2, size2;

    logic [15:0] x3_live, y3_live, size3_live;
    logic [15:0] x3, y3, size3;

    logic [15:0] x4_live, y4_live, size4_live;
    logic [15:0] x4, y4, size4;

    logic [15:0] x5_live, y5_live, size5_live;
    logic [15:0] x5, y5, size5;

    logic [15:0] x6_live, y6_live, size6_live;
    logic [15:0] x6, y6, size6;

    logic [15:0] x7_live, y7_live, size7_live;
    logic [15:0] x7, y7, size7;

    logic [15:0] x8_live, y8_live, size8_live;
    logic [15:0] x8, y8, size8;

    logic [15:0] x9_live, y9_live, size9_live;
    logic [15:0] x9, y9, size9;

    logic [15:0] x10_live, y10_live, size10_live;
    logic [15:0] x10, y10, size10;
	


   vga_counters counters(.clk50(clk), .*);

   always_ff @(posedge clk)
     if (reset) begin
  x1_live <= 100;
  y1_live <= 50;
  size1_live <= 10;

  x2_live <= 200;
  y2_live <= 100;
  size2_live <= 12;

  x3_live <= 300;
  y3_live <= 150;
  size3_live <= 8;

  x4_live <= 400;
  y4_live <= 200;
  size4_live <= 14;

  x5_live <= 500;
  y5_live <= 250;
  size5_live <= 6;

  x6_live <= 600;
  y6_live <= 300;
  size6_live <= 16;

  x7_live <= 700;
  y7_live <= 350;
  size7_live <= 9;

  x8_live <= 800;
  y8_live <= 400;
  size8_live <= 11;

  x9_live <= 150;
  y9_live <= 75;
  size9_live <= 13;

  x10_live <= 250;
  y10_live <= 125;
  size10_live <= 7;
     end else if (chipselect && write)
       case (address)
   5'h00 : x1_live <= writedata;
   5'h01 : y1_live <= writedata;
   5'h02 : size1_live <= writedata;
   5'h03 : x2_live <= writedata;
   5'h04 : y2_live <= writedata;
   5'h05 : size2_live <= writedata;
   5'h06 : x3_live <= writedata;
   5'h07 : y3_live <= writedata;
   5'h08 : size3_live <= writedata;
   5'h09 : x4_live <= writedata;
   5'h0A : y4_live <= writedata;
   5'h0B : size4_live <= writedata;
   5'h0C : x5_live <= writedata;
   5'h0D : y5_live <= writedata;
   5'h0E : size5_live <= writedata;
   5'h0F : x6_live <= writedata;
   5'h10 : y6_live <= writedata;
   5'h11 : size6_live <= writedata;
   5'h12 : x7_live <= writedata;
   5'h13 : y7_live <= writedata;
   5'h14 : size7_live <= writedata;
   5'h15 : x8_live <= writedata;
   5'h16 : y8_live <= writedata;
   5'h17 : size8_live <= writedata;
   5'h18 : x9_live <= writedata;
   5'h19 : y9_live <= writedata;
   5'h1A : size9_live <= writedata;
   5'h1B : x10_live <= writedata;
   5'h1C : y10_live <= writedata;
   5'h1D : size10_live <= writedata;
       endcase

      // Calculate differences and squared distances for each ball
      assign x1_diff = hcount - x1_live[10:0];
      assign y1_diff = vcount - y1_live[9:0];
      assign x1_squared = x1_diff * x1_diff;
      assign y1_squared = 32'd4 * (y1_diff * y1_diff);

      assign x2_diff = hcount - x2_live[10:0];
      assign y2_diff = vcount - y2_live[9:0];
      assign x2_squared = x2_diff * x2_diff;
      assign y2_squared = 32'd4 * (y2_diff * y2_diff);

      assign x3_diff = hcount - x3_live[10:0];
      assign y3_diff = vcount - y3_live[9:0];
      assign x3_squared = x3_diff * x3_diff;
      assign y3_squared = 32'd4 * (y3_diff * y3_diff);

      assign x4_diff = hcount - x4_live[10:0];
      assign y4_diff = vcount - y4_live[9:0];
      assign x4_squared = x4_diff * x4_diff;
      assign y4_squared = 32'd4 * (y4_diff * y4_diff);

      assign x5_diff = hcount - x5_live[10:0];
      assign y5_diff = vcount - y5_live[9:0];
      assign x5_squared = x5_diff * x5_diff;
      assign y5_squared = 32'd4 * (y5_diff * y5_diff);

      assign x6_diff = hcount - x6_live[10:0];
      assign y6_diff = vcount - y6_live[9:0];
      assign x6_squared = x6_diff * x6_diff;
      assign y6_squared = 32'd4 * (y6_diff * y6_diff);

      assign x7_diff = hcount - x7_live[10:0];
      assign y7_diff = vcount - y7_live[9:0];
      assign x7_squared = x7_diff * x7_diff;
      assign y7_squared = 32'd4 * (y7_diff * y7_diff);

      assign x8_diff = hcount - x8_live[10:0];
      assign y8_diff = vcount - y8_live[9:0];
      assign x8_squared = x8_diff * x8_diff;
      assign y8_squared = 32'd4 * (y8_diff * y8_diff);

      assign x9_diff = hcount - x9_live[10:0];
      assign y9_diff = vcount - y9_live[9:0];
      assign x9_squared = x9_diff * x9_diff;
      assign y9_squared = 32'd4 * (y9_diff * y9_diff);

      assign x10_diff = hcount - x10_live[10:0];
      assign y10_diff = vcount - y10_live[9:0];
      assign x10_squared = x10_diff * x10_diff;
      assign y10_squared = 32'd4 * (y10_diff * y10_diff);

   always_comb begin
      {VGA_R, VGA_G, VGA_B} = {8'h0, 8'h0, 8'h0};
      if (VGA_BLANK_n )
        if (x1_squared + y1_squared <= size1_live)
          {VGA_R, VGA_G, VGA_B} = {8'hff, 8'hff, 8'hff};
        else if (x2_squared + y2_squared <= size2_live)
          {VGA_R, VGA_G, VGA_B} = {8'hff, 8'hff, 8'hff};
        else if (x3_squared + y3_squared <= size3_live)
          {VGA_R, VGA_G, VGA_B} = {8'hff, 8'hff, 8'hff};
        else if (x4_squared + y4_squared <= size4_live)
          {VGA_R, VGA_G, VGA_B} = {8'hff, 8'hff, 8'hff};
        else if (x5_squared + y5_squared <= size5_live)
          {VGA_R, VGA_G, VGA_B} = {8'hff, 8'hff, 8'hff};
        else if (x6_squared + y6_squared <= size6_live)
          {VGA_R, VGA_G, VGA_B} = {8'hff, 8'hff, 8'hff};
        else if (x7_squared + y7_squared <= size7_live)
          {VGA_R, VGA_G, VGA_B} = {8'hff, 8'hff, 8'hff};
        else if (x8_squared + y8_squared <= size8_live)
          {VGA_R, VGA_G, VGA_B} = {8'hff, 8'hff, 8'hff};
        else if (x9_squared + y9_squared <= size9_live)
          {VGA_R, VGA_G, VGA_B} = {8'hff, 8'hff, 8'hff};
        else if (x10_squared + y10_squared <= size10_live)
          {VGA_R, VGA_G, VGA_B} = {8'hff, 8'hff, 8'hff};
        else
          {VGA_R, VGA_G, VGA_B} = {0, 0, 0};
   end
	       
endmodule

module vga_counters(
 input logic 	     clk50, reset,
 output logic [10:0] hcount,  // hcount[10:1] is pixel column
 output logic [9:0]  vcount,  // vcount[9:0] is pixel row
 output logic 	     VGA_CLK, VGA_HS, VGA_VS, VGA_BLANK_n, VGA_SYNC_n);

/*
 * 640 X 480 VGA timing for a 50 MHz clock: one pixel every other cycle
 * 
 * HCOUNT 1599 0             1279       1599 0
 *             _______________              ________
 * ___________|    Video      |____________|  Video
 * 
 * 
 * |SYNC| BP |<-- HACTIVE -->|FP|SYNC| BP |<-- HACTIVE
 *       _______________________      _____________
 * |____|       VGA_HS          |____|
 */
   // Parameters for hcount
   parameter HACTIVE      = 11'd 1280,
             HFRONT_PORCH = 11'd 32,
             HSYNC        = 11'd 192,
             HBACK_PORCH  = 11'd 96,   
             HTOTAL       = HACTIVE + HFRONT_PORCH + HSYNC +
                            HBACK_PORCH; // 1600
   
   // Parameters for vcount
   parameter VACTIVE      = 10'd 480,
             VFRONT_PORCH = 10'd 10,
             VSYNC        = 10'd 2,
             VBACK_PORCH  = 10'd 33,
             VTOTAL       = VACTIVE + VFRONT_PORCH + VSYNC +
                            VBACK_PORCH; // 525

   logic endOfLine;
   
   always_ff @(posedge clk50 or posedge reset)
     if (reset)          hcount <= 0;
     else if (endOfLine) hcount <= 0;
     else  	         hcount <= hcount + 11'd 1;

   assign endOfLine = hcount == HTOTAL - 1;
       
   logic endOfField;
   
   always_ff @(posedge clk50 or posedge reset)
     if (reset)          vcount <= 0;
     else if (endOfLine)
       if (endOfField)   vcount <= 0;
       else              vcount <= vcount + 10'd 1;

   assign endOfField = vcount == VTOTAL - 1;

   // Horizontal sync: from 0x520 to 0x5DF (0x57F)
   // 101 0010 0000 to 101 1101 1111
   assign VGA_HS = !( (hcount[10:8] == 3'b101) &
		      !(hcount[7:5] == 3'b111));
   assign VGA_VS = !( vcount[9:1] == (VACTIVE + VFRONT_PORCH) / 2);

   assign VGA_SYNC_n = 1'b0; // For putting sync on the green signal; unused
   
   // Horizontal active: 0 to 1279     Vertical active: 0 to 479
   // 101 0000 0000  1280	       01 1110 0000  480
   // 110 0011 1111  1599	       10 0000 1100  524
   assign VGA_BLANK_n = !( hcount[10] & (hcount[9] | hcount[8]) ) &
			!( vcount[9] | (vcount[8:5] == 4'b1111) );

   /* VGA_CLK is 25 MHz
    *             __    __    __
    * clk50    __|  |__|  |__|
    *        
    *             _____       __
    * hcount[0]__|     |_____|
    */
   assign VGA_CLK = hcount[0]; // 25 MHz clock: rising edge sensitive
   
endmodule
