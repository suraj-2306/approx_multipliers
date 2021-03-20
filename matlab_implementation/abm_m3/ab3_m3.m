function sum_number_ans = ab3_m3(s_first_bin,s_second_bin,m)
	or_bit=0;
	first_bin = abs(int32(s_first_bin));
	second_bin = abs(int32(s_second_bin));
	number=int32(0);
	bit_size=32;
	sum_number=int32(0);
	second_encoded = fliplr(booth_encoder_radix_4(second_bin,16));

	for i = 1:9
		if(second_encoded(i)~=0)
			if(second_encoded(i)==1)
				number = bitshift(first_bin,2*(i-1));
			elseif(second_encoded(i)==-1)
				number = -bitshift(first_bin,2*(i-1));
			elseif(second_encoded(i)==2)
				number = bitshift(first_bin,2*(i-1)+1);
			elseif(second_encoded(i)==-2)
				number = -bitshift(first_bin,2*(i-1)+1);
			end

			lower_number = vec_to_int32(bitget(abs(number),1:m));

			upper_number=vec_to_int32(bitget(abs(number),(m+1):bit_size));
			upper_number = bitshift(upper_number,m);

			for j=1:m
				or_bit=or_bit | bitget(lower_number,j);
			end
			or_bit = bitshift(int32(or_bit),m-1);
			sign_number = int32(upper_number+or_bit);
			if(second_encoded(i)<0)
				sum_number=sum_number-sign_number;
			else
				sum_number=sum_number+sign_number;
			end
		end
	end

	if(s_first_bin*s_second_bin>0)
		sum_number_ans = sum_number;
	else
		sum_number_ans = -sum_number;
	end
end
