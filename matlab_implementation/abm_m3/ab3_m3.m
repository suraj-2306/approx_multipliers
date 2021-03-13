function sum_number_ans = ab3_m3(first_bin,second_bin,m)
	or_bit=1;
	first_bin = abs(int64(first_bin));
	second_bin = abs(int64(second_bin));

	bit_size=64;
	sum_number=int64(0);
	for i = 1:bit_size
		if(bitget(second_bin,i)==1)
			number = bitshift(first_bin,i-1);
			lower_number = vec_to_int64(bitget(number,1:m));
			upper_number=vec_to_int64(bitget(number,(m+1):bit_size));
			upper_number = bitshift(upper_number,m);

			for j=1:m
				or_bit=or_bit | bitget(lower_number,j);
			end
			or_bit = bitshift(int64(or_bit),m-1);
			sum_number=sum_number+int64(upper_number+or_bit);
		end
	end
	if(first_bin*second_bin>0)
		sum_number_ans = sum_number;
	else
		sum_number_ans = -sum_number;

	end
end
