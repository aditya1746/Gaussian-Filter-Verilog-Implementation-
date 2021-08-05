module testbench;
	
	parameter size = 36960, rows = 168, cols = 220;

	process #(.infile("eye_in_hex.hex"),.outfile("eye_out_3_hex.hex"),.size(size),.rows(rows),.cols(cols),.ksize(3)) k3();  //instantiating module process which will give output hex file for kernel size 3x3
	process #(.infile("eye_in_hex.hex"),.outfile("eye_out_5_hex.hex"),.size(size),.rows(rows),.cols(cols),.ksize(5)) k5();  //instantiating module process which will give output hex file for kernel size 3x3
	process #(.infile("eye_in_hex.hex"),.outfile("eye_out_7_hex.hex"),.size(size),.rows(rows),.cols(cols),.ksize(7)) k7();  //instantiating module process which will give output hex file for kernel size 3x3
	
endmodule

//-------------------------------THIS IS FOR GRAYSCALE IMAGES------------------------------

// "eye_in_hex.hex" is the input hex file

// "eye_out_3_hex.hex" is the output hex file for the image processed with kernel of 3x3
// "eye_out_5_hex.hex" is the output hex file for the image processed with kernel of 5x5
// "eye_out_7_hex.hex" is the output hex file for the image processed with kernel of 7x7

// rows and cols are the number of rows and cols in input mage file
// size = rows x cols x 3(for color images)   size = rows x cols for grayscale images