m = 8;
i = int64(0);
j = int64(0);
RED = int64(0)
resolution = 7
for i=-256:255
	for j=-256:255
		if(i~=0 && j~=0)
			a=  double(i*j);
			RED =double(RED)+abs(double(i*j-ab3_m3(i,j,m))/a)

		end
	end
end
MRED =  vpa((RED)/(2^32))
