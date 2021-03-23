function [encoded_array] = booth_encoder_radix_2(variable,bin_size)
	variable = int32(variable);
	encoded_array = zeros(1,bin_size/2);
	variable = bitshift(variable,1);
	for index=0:2:bin_size
		lb_0 = bitget(variable,bin_index(index));
		lb_1 = bitget(variable,bin_index(index+1));
		lb_2 = bitget(variable,bin_index(index+2));
		%booth_encoded= bitget(variable,0);
		if (lb_2==0 && lb_1==0 && lb_0==1) || ( lb_2==0 && lb_1==1 && lb_0==0) 
			encoded_array(bin_index(index/2)) = 1;
		elseif(lb_2==0 && lb_1==0 && lb_0==0) || ( lb_2==1 && lb_1==1 && lb_0==1)
			encoded_array(bin_index(index/2)) = 0; 
		elseif(lb_2==1 && lb_1==0 && lb_0==1) || ( lb_2==1 && lb_1==1 && lb_0==0)
			encoded_array(bin_index(index/2)) = -1;
		elseif (lb_2==0 && lb_1==1 && lb_0==1)
			encoded_array(bin_index(index/2)) = 2; 
		elseif (lb_2==1 && lb_1==0 && lb_0==0)
			encoded_array(bin_index(index/2)) = -2;
		end
	end
	encoded_array = fliplr(encoded_array);
end


