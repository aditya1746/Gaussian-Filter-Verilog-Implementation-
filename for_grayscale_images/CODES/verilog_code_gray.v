module process#(parameter infile = "eye_in_hex.hex", outfile = "image_out.hex", size = 36960, rows = 168, cols = 220, ksize = 5)();

    	real result[rows-1:0][cols-1:0],SigmaMatrix[ksize-1:0][ksize-1:0],ColumnVector[ksize-1:0],RowVector[ksize-1:0],sum_g,sum_s = 0,value = 1,temp = 1;
    	
		reg[7:0] memory[size-1:0];                            //making a vector of type 'reg' for storing data from input hex file
		
		integer image_in[rows-1:0][cols-1:0], dx = ksize/2,dy = ksize/2,c = ksize/2,i,j,k = 0,l,y,z,f;
	
	initial 
		begin
			f = $fopen(outfile,"w");                          //opening the output hex file
	
			$readmemh(infile,memory);                         //reading the input hex file and storing it's values in the vector 'memory'

			for(i = 0;i<rows;i=i+1)
			begin
				for(j = 0;j<cols;j=j+1)                       // each pixel has the value of intnsity at that pixel
				begin
					image_in[i][j] = memory[k];               //forming 2D matrix storing intensity values of pixels
					k = k+1;
				end
			end

	//-------------------------------------FORMING SIGMAMATRIX (KERNEL)-----------------------------------
	
	
			for(i=0;i<ksize;i=i+1)
			begin
    				ColumnVector[i] = factorial(ksize-1)/(factorial(ksize-1-i)*factorial(i));
        			RowVector[i] = factorial(ksize-1)/(factorial(ksize-1-i)*factorial(i));
    			end
			
    			for(i=0;i<ksize;i=i+1)
			begin
       				for(j=0;j<ksize;j=j+1)
				begin
            				SigmaMatrix[i][j] = ColumnVector[i]*RowVector[j];
            			end
			end

   			for(i = 0;i<ksize;i=i+1)
    			begin
    				for(j = 0;j<ksize;j=j+1)
    				begin
    					sum_s = sum_s + SigmaMatrix[i][j];
				end
			end	

			for(i = 0;i<ksize;i=i+1)
    			begin
    				for(j = 0;j<ksize;j=j+1)
    				begin
    					SigmaMatrix[i][j] = SigmaMatrix[i][j]/sum_s;
				end
			end

	//----------------------------------------KERNEL IS FORMED----------------------------------------
	
	//----------------------------------------START OF CONVOLOUTION PROCESS---------------------------
	
	
			for (i = 0; i < rows; i=i+1)
    			begin
        			for (j = 0; j < cols; j=j+1)
        			begin
							sum_g = 0;
							
            				for (k = dx; k >= ((-1) * dx); k=k-1)
            				begin
                				for (l = dy; l >= ((-1) * dy); l=l-1)
                				begin
                    					y = i + k;
                    					z = j + l;

                    					if ((i + k) >= 0 && (i + k) < rows && (j + l) >= 0 && (j + l) < cols)
                    					begin
                    						sum_g = sum_g + (image_in[y][z] * SigmaMatrix[(c + k)][(c + l)]);
                    					end
                				end
            				end

            				result[i][j] = sum_g;                       //storing new pixel values
							
							$fdisplay(f,"%2h",result[i][j]);            //writing new pixel values to output hex file
        			end
			end
			
			$fclose(f);                                                //closing output hex file
		end

	//-------------------------------------FUNCTION FOR CALCULATING FACTORIAL-----------------------------
	
	
	function real factorial;

		input real num;
   		begin
   			if(num==0)
       				factorial = 1;
			else
			begin
    				value=1;temp = 1;
    					
    				for(temp=1;temp<=num;temp= temp+1)
				begin	
   				     value = value*temp;
    				end
    
				factorial = value;
			end
		end
	endfunction
endmodule