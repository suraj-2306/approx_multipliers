RED = zeros(4);
ED = zeros(4);
m=2;
for i = -2^15:(2^15)-1
	for j = -2^15:(2^15)-1
		if(i~=0 && j~=0)
			acc_ans = i*j;
			RED(m) = RED(m) + abs(acc_ans-abm_m3(i,j,m))/acc_ans;   %total relative error dist for each m
			ED(m) = ED(m) + abs(acc_ans-abm_m3(i,j,m));             %total error distance for each m
		end
	end
end

MED = ED/((2^16-1)^2);       % mean error distance
NMED = MED/((2^15)-1)^2;     % normalised mean error dist
MRED = RED/((2^16-1)^2);     % Mean relative error distance

