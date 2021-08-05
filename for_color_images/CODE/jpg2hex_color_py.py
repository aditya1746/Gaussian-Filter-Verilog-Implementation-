import cv2                                                     #importing cv2 library

img = cv2.imread('rahul_input_img.jpg')                                  #storing the input color image in 'img'

rows,cols,px = img.shape
print(img.shape)
print(img.size)

newfile = open('rahul_in_hex.hex',mode = 'w')               #creating .hex file for storing pixel values this hex file will serve as input for our verilog code


for i in range(rows):
	for j in range(cols):

		val = hex(img[i,j,0]).replace('0x','')                #pixel value of blue color

		newfile.write(val)                                    #writing pixel value to .hex file
		newfile.write('\n')

		val = hex(img[i,j,1]).replace('0x','')                #pixel value of green color

		newfile.write(val)                                    #writing pixel value to .hex file
		newfile.write('\n')

		val = hex(img[i,j,2]).replace('0x','')                #pixel value of red color

		newfile.write(val)                                    #writing pixel value to .hex file
		newfile.write('\n')
			
newfile.close()                                               #closing .hex file