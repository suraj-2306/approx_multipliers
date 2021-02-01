
function [encoded_array] = booth_encoder_radix_2(variable,bin_size)
	variable = uint16(variable);
	encoded_array = zeros(1,bin_size+1);
	variable = bitshift(variable,1);
	for index=0:bin_size
		lb_0 = bitget(variable,bin_index(index),'uint16');
		lb_1 = bitget(variable,bin_index(index+1),'uint16');
		%booth_encoded= bitget(variable,0);
		if lb_1==0 && lb_0==1
			encoded_array(bin_index(index)) = 1;
		elseif lb_1==1 && lb_0==0
			encoded_array(bin_index(index)) = -1;
		end
	end
	encoded_array(end)=[];
	encoded_array = fliplr(encoded_array);
end


