function [result] = booth_multiplier_radix_2(num_1,num_2)
	result = int16(0);
	num_1 = int16(num_1);
	num_2 = int16(num_2);
	lb_0 = 0;
	for index=0:7
		lb_1 = bitget(num_1,bin_index(0),'int16');
		if lb_1==0 && lb_0==1
			result = result+bitshift(num_2,8);
		elseif lb_1==1 && lb_0==0
			result = result-bitshift(num_2,8);
		end
		num_1 = bitshift(num_1,-1);
		result = bitshift(result,-1);
		lb_0 = lb_1;
	end
end

