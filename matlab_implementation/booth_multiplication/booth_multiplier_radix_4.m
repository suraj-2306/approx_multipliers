function [answer] = booth_multiplier_radix_4(num_1,num_2)
	result = int32(0);
	answer = int32(0);
	num_1 = int32(num_1)
	num_2 = int32(num_2);
	lb_0 = 0
	for index=0:2:7
		lb_1 = bitget(num_1,bin_index(index),'int32')
		lb_2 = bitget(num_1,bin_index(index+1),'int32')
		if (lb_2==0 && lb_1==0 && lb_0==1) || ( lb_2==0 && lb_1==1 && lb_0==0 ) 
			result = +bitshift(num_2,index)
		elseif(lb_2==1 && lb_1==0 && lb_0==1) || ( lb_2==1 && lb_1==1 && lb_0==0 )
			result = -bitshift(num_2,index) 
		elseif (lb_2==0 && lb_1==1 && lb_0==1)
			result = + bitshift(num_2,index+1) 
		elseif (lb_2==1 && lb_1==0 && lb_0==0)
			result = - bitshift(num_2,index+1)
		elseif (lb_2==1 && lb_1==1 && lb_0==1) || ( lb_2==0 && lb_1==0 && lb_0==0 )
			result = 0
		else
			result = 0;
		end
		%num_1 = bitshift(num_1,-2);
		%answer = bitshift(result,index/2)+answer
		answer = result + answer
		lb_0 = lb_2
	end
end

