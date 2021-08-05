import cv2                                                    #importing cv2 library
import numpy as np                                            #importing numpy library

n1 = open('rahul_out_3_hex.hex','r')                        #opening .hex file for kernel of 3x3 which is the output file of verilog code
n2 = open('rahul_out_5_hex.hex','r')                        #opening .hex file for kernel of 5x5 which is the output file of verilog code
n3 = open('rahul_out_7_hex.hex','r')                        #opening .hex file for kernel of 7x7 which is the output file of verilog code

img1 = np.zeros((192,192,3),np.uint8)                         #creating image for storing output image processed by kernel of 3x3
img2 = np.zeros((192,192,3),np.uint8)                         #creating image for storing output image processed by kernel of 5x5
img3 = np.zeros((192,192,3),np.uint8)				          #creating image for storing output image processed by kernel of 7x7


#-----------------------------------------reading from opened hex files and storing new pixel values in images---------------------------------------

for i in range(192):
	for j in range(192):

		s1 = n1.readline()
		img1[i,j,0] = int(s1,16)

		s1 = n1.readline()
		img1[i,j,1] = int(s1,16)

		s1 = n1.readline()
		img1[i,j,2] = int(s1,16)

		s2 = n2.readline()
		img2[i,j,0] = int(s2,16)

		s2 = n2.readline()
		img2[i,j,1] = int(s2,16)

		s2 = n2.readline()
		img2[i,j,2] = int(s2,16)

		s3 = n3.readline()
		img3[i,j,0] = int(s3,16)

		s3 = n3.readline()
		img3[i,j,1] = int(s3,16)

		s3 = n3.readline()
		img3[i,j,2] = int(s3,16)


#----------------------------------------showing the new images-------------------------------------

cv2.imshow('image1',img1)
cv2.imshow('image2',img2)
cv2.imshow('image3',img2)

#----------------------------------------writing new images to corresponding jpg files which is the final output-----------------

cv2.imwrite('rahul_out_3_img.jpg',img1)
cv2.imwrite('rahul_out_5_img.jpg',img2)
cv2.imwrite('rahul_out_7_img.jpg',img3)

#---------------------------------------closing the files------------------------------------------------------

n1.close()
n2.close()
n3.close()

cv2.waitKey(0)
cv2.destroyAllWindows()
