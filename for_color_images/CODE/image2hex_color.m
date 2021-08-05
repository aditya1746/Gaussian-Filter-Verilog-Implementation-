b = imread('rahul.bmp');

k = 1;

for i=1:192
for j = 1:192

a(k) = b(i,j,3);
k = k+1;
a(k) = b(i,j,2);
k = k+1;
a(k) = b(i,j,1);
k = k+1;

end
end

fid = fopen('rahul_in.hex','wt');
fprintf(fid,'%x\n',a);
fclose(fid);