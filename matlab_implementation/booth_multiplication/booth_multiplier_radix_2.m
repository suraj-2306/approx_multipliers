function [answer] = booth_multiplier_radix_2(num_1,num_2)
	result = int32(0);
	answer = int32(0);
	num_1 = int32(num_1);
	num_2 = int32(num_2);
	lb_0 = 0;
	for index=0:15
		lb_1 = bitget(num_1,bin_index(index),'int32');
		if lb_1==0 && lb_0==1
			result = +bitshift(num_2,index);
		elseif lb_1==1 && lb_0==0
			result =-bitshift(num_2,index);
		else 
			result =0;
		end
		%num_1 = bitshift(num_1,-1);
		%result = bitshift(result,-1);
		answer = result + answer;
		lb_0 = lb_1;
	end
end

