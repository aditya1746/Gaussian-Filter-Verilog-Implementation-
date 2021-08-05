b = imread('eye_in.bmp');

k = 1;

for i=1:168
for j = 1:220

a(k) = b(i,j);
k = k+1;

end
end

fid = fopen('eye_in.hex','wt');
fprintf(fid,'%x\n',a);
fclose(fid);