module testbench_color;
	
	parameter size = 110592, rows = 192, cols = 192;

	color #(.infile("rahul_in_hex.hex"),.outfile("rahul_out_3_hex.hex"),.size(size),.rows(rows),.cols(cols),.ksize(3)) k3(); //instantiating module color which will give output hex file for kernel size 3x3
	color #(.infile("rahul_in_hex.hex"),.outfile("rahul_out_5_hex.hex"),.size(size),.rows(rows),.cols(cols),.ksize(5)) k5(); //instantiating module color which will give output hex file for kernel size 5x5
	color #(.infile("rahul_in_hex.hex"),.outfile("rahul_out_7_hex.hex"),.size(size),.rows(rows),.cols(cols),.ksize(7)) k7(); //instantiating module color which will give output hex file for kernel size 7x7
endmodule

//--------------------------------THIS IS FOR COLOR IMAGES-----------------------------------

// "rahul_in_hex.hex" is the input hex file

// "rahul_out_3_hex.hex" is the output hex file for the image processed with kernel of 3x3
// "rahul_out_5_hex.hex" is the output hex file for the image processed with kernel of 5x5
// "rahul_out_7_hex.hex" is the output hex file for the image processed with kernel of 7x7

// rows and cols are the number of rows and cols in input mage file
// size = rows x cols x 3(for color images)   size = rows x cols for grayscale images
