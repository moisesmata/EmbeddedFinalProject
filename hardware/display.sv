/*
 * Avalon memory-mapped peripheral that generates VGA
 *
 * Stephen A. Edwards
 * Columbia University
 *
 * Register map:

 *  Memory-mapped framebuffer:
 * - 32K addressable locations (15-bit address)
 * - Each 32-bit word contains 32 pixels (1 bit per pixel)
 * - Addressing: 0x0000 to 0x7FFF
 * - Pixel data: 1 = white (0xFF), 0 = black (0x00)
 * - Pixels are read from framebuffer in sequence and displayed on screen
 */
// This module is built to run on 50 mhz, to get it on 100 you need to do some things.
module vga_ball(input logic        clk,
	        input logic 	   reset,
		input logic [31:0]  writedata,
		input logic 	   write,
		input 		   chipselect,
		input logic [14:0]  address,

		output logic [7:0] VGA_R, VGA_G, VGA_B,
		output logic 	   VGA_CLK, VGA_HS, VGA_VS,
		                   VGA_BLANK_n,
		output logic 	   VGA_SYNC_n);

   logic [10:0]	   hcount;
   logic [9:0]     vcount;
   logic [31:0]    vcount_32;
   logic [31:0]     vcount_x_512;
   logic [31:0]     vcount_x_128;
   logic [31:0]    vcountx20;

   logic [14:0]    rdaddress;
   logic [31:0]    placecounter;
   logic [31:0]    next_pix;
   logic [31:0]   readdata;
   
   vga_counters counters(.clk50(clk), .*);

   RAM_DISP framebuffer(
      .clock(clk),
      .data(writedata),
      .wren(write),
      .wraddress(address), 
      .rdaddress(rdaddress),
      .q(readdata)
    );
    assign vcount_32 = {22'b0, vcount};
    assign next_pix = placecounter + 32'd1;
    assign vcount_x_512 = vcount_32 << 7;
    assign vcount_x_128 = vcount_32 << 9;
      assign vcountx20 = vcount_x_128 + vcount_x_512;
      assign placecounter = vcountx20 + hcount[10:1];
    assign rdaddress = placecounter[19:5];
    

   always_comb begin
      if (readdata[placecounter[4:0]] == 1'b1) begin
         VGA_R = 8'hff;
         VGA_G = 8'hff;
         VGA_B = 8'hff;
      end else begin
         VGA_R = 8'h00;
         VGA_G = 8'h00;
         VGA_B = 8'h00;
      end
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
