function num = vec_to_int64(vec)
	sum_num=int64(0);
	vec = int64(vec);
	%vec = fliplr(vec);
	for i=1:length(vec)
		sum_num = vec(i)*2^(i-1)+sum_num;
	end
	num = sum_num;
	
end


