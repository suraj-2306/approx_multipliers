function [sign_array,answer] = pp_gen_m(a,b,m)
	bin_size = 16;
	a = [0,(a(1:16))];
	b = [0,(b(1:16))];

	pp_matrix = zeros(8,19);
	% generating the exact pp_matrix
	sign_array = zeros(1,8);
	for i=0:2:bin_size-1
		lb_0_b = b(bin_index(i));
		lb_1_b = b(bin_index(i+1));
		lb_2_b = b(bin_index(i+2));
		for j= 0:1:bin_size-1
			lb_0_a = a(bin_index(j));
			lb_1_a = a(bin_index(j+1));
			ppij = ( or( and( xor(lb_1_b,lb_0_b),xor(lb_2_b,lb_1_a) ), and(and(not(xor(lb_1_b,lb_0_b)),xor(lb_2_b,lb_1_b)),xor(lb_2_b,lb_0_a)) ) );
			pp_matrix(bin_index(i/2),bin_index(j)) = ppij ;
		end
		% for the sign bit from only b
		if((lb_2_b==1 && lb_1_b==1 &&lb_0_b==1) || (lb_2_b==0 && lb_1_b==0 &&lb_0_b==0))
			sign_bit = 0;
		else
			sign_bit = lb_2_b;
		end

		%sign_bit
		%for the sign array formation
		if sign_bit==1
			sign_array(bin_index(i/2)) = sign_bit;
		end

		%pp_matrix
		%for the sign bit from only a and the sign on the corresponding encoded radix 4 b

		if a(17) ==0
			if (lb_2_b==1 && lb_1_b==0 &&lb_0_b==0)
				sign_bit=1;
			elseif (lb_2_b==1 && lb_1_b==0 &&lb_0_b==1)
				sign_bit=1;
			elseif (lb_2_b==1 && lb_1_b==1 &&lb_0_b==0)
				sign_bit=1;
			else
				sign_bit=0;
			end
		elseif a(17)==1
			if (lb_2_b==0 && lb_1_b==0 &&lb_0_b==1)
				sign_bit=1;
			elseif (lb_2_b==0&& lb_1_b==1 &&lb_0_b==0)
				sign_bit=1;
			elseif (lb_2_b==0&& lb_1_b==1 &&lb_0_b==1)
				sign_bit=1;
			else
				sign_bit=0;
			end
		end

		%adding the sign correction terms
		%for debugging
		%fprintf('%d %d %d\n',lb_2_b,lb_1_b,lb_0_b);
		%pp_matrix;

		%sign_bit;
		%for the sign extension terms
		if (i==0)
			pp_matrix(bin_index(i),:) = [pp_matrix(bin_index(i),1:16),[sign_bit,sign_bit,~sign_bit]];
		else
			pp_matrix(bin_index(i/2),:) = [pp_matrix(bin_index(i/2),1:16),[~sign_bit,1,0]];
		end

	end
	%for debugging
	%sign_array;
	%pp_matrix;
	answer = pp_matrix;
end
