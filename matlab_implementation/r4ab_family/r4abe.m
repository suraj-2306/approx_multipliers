function [sum_of_pp] =r4ab(first_bin,second_bin)
	bin_size=16;
	first_bin = int32(bitshift(first_bin,1));
	second_bin= int32(bitshift(second_bin,1));
	%encoded_array = zeros(1,bin_size/2);

	%variable = bitshift(variable,1);
	sum_of_pp = int64(0);
	for i=0:2:bin_size-1
		lb_0_b = bitget(second_bin,bin_index(i));
		lb_1_b = bitget(second_bin,bin_index(i+1));
		lb_2_b = bitget(second_bin,bin_index(i+2));
		pp_row = int64(0);
		for j= 0:1:bin_size
			lb_0_a = bitget(first_bin,bin_index(j));
			lb_1_a = bitget(first_bin,bin_index(j+1));
			%ppij = int32(and(xor(lb_1_b,lb_0_b),xor(lb_2_b,lb_1_a)));
			ppij = int64( or( and( xor(lb_1_b,lb_0_b),xor(lb_2_b,lb_1_a)), and(and(not(xor(lb_1_b,lb_0_b)),xor(lb_2_b,lb_1_b)),xor(lb_2_b,lb_0_a))));
			%pp_row = pp_row + bitshift(e_ppij,j);
			pp_row = pp_row +(bitshift(ppij,j));
			%fprintf('%d\n',ppij)
			%fprintf('%d%d%d   %d%d\n',lb_2_b,lb_1_b,lb_0_b,lb_1_a,lb_0_a);
			%fprintf('%s\n',dec2bin(pp_row));
		end
		sign_bit = int64(lb_2_b);
		%if(i==0)
		%pp_row;
		%bitshift(sign_bit,bin_size);
		%length(dec2bin(bitshift(int16(~sign_bit),bin_size+3)));
		%pp_row = pp_row+ int64(bitshift(int16(sign_bit),bin_size+1))+int64(bitshift(int16(sign_bit),bin_size+2))+int64(bitshift(custom_not(sign_bit),bin_size+3))+int64(sign_bit)
		%else
		pp_row = pp_row+int64(bitshift(custom_not(sign_bit),bin_size+1)+bitshift(1,bin_size+2))+(sign_bit);
		%end
		%i
		%fprintf('%s %d %d\n',dec2bin(bitshift(pp_row,i)),length(dec2bin(bitshift(pp_row,i))),sign_bit);
		sum_of_pp = sum_of_pp + int64(bitshift(pp_row,i))+ int64(bitshift(1,14));
		%fprintf('%d %d\n',pp_row,sum_of_pp)
	end
	fprintf('\n%s %d',dec2bin(sum_of_pp),length(dec2bin(sum_of_pp)))
	%answer = dec2bin(sum_of_pp);
	%sum_of_pp = bin2dec(answer(2:18))
	%sum_of_pp = int16(sum_of_pp)
	%if sum_of_pp>2^17
	%sum_of_pp = sum_of_pp-2^17;

end
