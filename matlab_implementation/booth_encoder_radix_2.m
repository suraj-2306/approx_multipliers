function [encoded_array] = booth_encoder_radix_2(var,bin_size)
	var = uint16(var);
	encoded_array = zeros(1,bin_size+1);
	var = bitshift(var,1);
	for index=0:bin_size
		lb_0 = bitget(var,bin_index(index),'uint16');
		lb_1 = bitget(var,bin_index(index+1),'uint16');
		%booth_encoded= bitget(var,0);
		if lb_1==0 && lb_0==1
			encoded_array(bin_index(index)) = 1;
		elseif lb_1==1 && lb_0==0
			encoded_array(bin_index(index)) = -1;
		end
	end
	encoded_array(end)=[];
	encoded_array = fliplr(encoded_array);
end


