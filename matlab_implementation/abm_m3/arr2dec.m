function answer = arr2dec(arr)
	n = numel(arr);
	if(arr(n)==0)
		arr_sum = int64(0);
		for i=1:n
			arr_sum = arr_sum + (2^(i-1))*arr(i);
		end
		answer = (arr_sum);
	else
		arr_sum = int64(-2^(n-1));
		for i = 1:n-1
			arr_sum = arr_sum + (2^(i-1))*arr(i);
		end
		answer = (arr_sum);
	end
end

