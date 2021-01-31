function [encoded_array] = booth_encoder_radix_2(var,bin_size)
	var = uint16(var);
	encoded_array = zeros(1,bin_size/2);
	
	var = bitshift(var,1);
	for index=0:2:bin_size-1
		lb_0 = bitget(var,bin_index(index),'uint16');
		lb_1 = bitget(var,bin_index(index+1),'uint16');
		lb_2 = bitget(var,bin_index(index+2),'uint16');
		%booth_encoded= bitget(var,0);
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


