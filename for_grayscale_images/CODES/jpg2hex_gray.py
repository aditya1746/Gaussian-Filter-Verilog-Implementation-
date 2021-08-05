import cv2     												#importing cv2 library

img = cv2.imread('eye_input_img.jpg',0)                            #storing the input grayscale image in 'img'

rows,cols = img.shape
print(img.shape)
print(img.size)

newfile = open('eye_in_hex.hex',mode = 'w')                    #creating .hex file for storing pixel values this hex file will serve as input for our verilog code 

for i in range(rows):
	for j in range(cols):

		val = hex(img[i,j]).replace('0x','')               #writing to .hex file

		newfile.write(val)
		newfile.write('\n')
			
newfile.close()                                            #closing.hex file