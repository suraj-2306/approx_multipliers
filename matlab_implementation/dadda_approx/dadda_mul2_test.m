i = int16(0);
j = int16(0);
RED = int64(0);
for i=0:255
	for j=0:255
		RED =double(RED)+double(abs((i*j-dadda_mul2(i,j))))
	end
end
MED =  vpa((RED)/(2^16))
NED = vpa(MED/(2^8-1)^2)
