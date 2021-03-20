function sum_num = vec_to_int32(vec)
	sum_num=int32(0);
	vec = int32(vec);
	%vec = fliplr(vec);
	for i=1:length(vec)
		sum_num = vec(i)*2^(i-1)+sum_num;
	end
	%num = sum_num;
	
end


