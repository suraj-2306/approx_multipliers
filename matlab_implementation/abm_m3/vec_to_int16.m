function num = vec_to_int16(vec)
	sum_num=int16(0);
	vec = int16(vec);
	%vec = fliplr(vec);
	for i=1:length(vec)
		sum_num = vec(i)*2^(i-1)+sum_num;
	end
	num = sum_num;
	
end


