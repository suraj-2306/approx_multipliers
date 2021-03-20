m = 2;
i = int16(0);
j = int16(0);
RED = int64(0);
for i=-2048:2047
	for j=-2048:2047
		if(i~=0 && j~=0)
			a=  double(i*j);
			RED =double(RED)+abs(double(i*j-ab3_m3(i,j,m))/a)
		end
	end
end
MRED =  vpa((RED)/(2^24))
