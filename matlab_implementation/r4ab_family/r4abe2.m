
function [sum_of_pp] =r4abe2(first_bin,second_bin,p)
	bin_size=16;
	first_bin = int64(bitshift(first_bin,1));
	second_bin= int64(bitshift(second_bin,1));
	sum_of_pp = int64(0);
	for i=0:2:bin_size-1
		lb_0_b = bitget(second_bin,bin_index(i));
		lb_1_b = bitget(second_bin,bin_index(i+1));
		lb_2_b = bitget(second_bin,bin_index(i+2));
		pp_row = int64(0);

		for j= 0:1:bin_size
			lb_0_a = bitget(first_bin,bin_index(j));
			lb_1_a = bitget(first_bin,bin_index(j+1));
			if(i+j<p)
				ppij = int64(xor(lb_1_a,lb_2_b));
			else
				ppij = int64( or( and( xor(lb_1_b,lb_0_b),xor(lb_2_b,lb_1_a) ), and(and(not(xor(lb_1_b,lb_0_b)),xor(lb_2_b,lb_1_b)),xor(lb_2_b,lb_0_a)) ) );
			end
			pp_row = pp_row +(bitshift(ppij,j));

		end
		encoded_array =fliplr(booth_encoder_radix_4(bitshift(second_bin,-1),16));
		sign_bit=int64(0);
		index = i/2;
		if encoded_array(bin_index(index))<0
			sign_bit=int64(1);
		end
		if(i==14)
			pp_row = int64(bitshift(custom_not(sign_bit),bin_size+1))+pp_row + bitshift(1,bin_size+2);
		else
			pp_row = int64(bitshift(custom_not(sign_bit),bin_size+1))+pp_row + bitshift(1,bin_size+2)+sign_bit;
		end
		sum_of_pp  = sum_of_pp+ int64(bitshift(pp_row,i))+ int64(bitshift(1,14));
		%fprintf('%s %d %d %d\n',dec2bin(bitshift(pp_row,i)),length(dec2bin(bitshift(pp_row,i))),lb_2_b,i);
	end
	sum_of_pp = fliplr(dec2bin(sum_of_pp));
	sum_of_pp = bin2dec(fliplr(sum_of_pp(1:33)));
	%fprintf('\n%s %d',dec2bin(sum_of_pp),length(dec2bin(sum_of_pp)))
end
