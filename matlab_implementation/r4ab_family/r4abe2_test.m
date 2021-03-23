p = 2;
i = int16(0);
j = int16(0);
RED = int64(0);
for i=-32768:32767
	for j=-32768:32767
		if(i~=0 && j~=0)
			a=  double(abs(i*j));
			RED =double(RED)+double((abs(i*j)-r4abe2(abs(i),abs(j),p))/a)
			%fprintf('%d %d %d %d\n',i,j,a,RED)
		end
	end
end
MRED =  vpa((RED)/(2^32))
