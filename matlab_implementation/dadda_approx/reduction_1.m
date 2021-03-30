function [matrix] = reduction_1(first_bin,second_bin)
	matrix = zeros(8,8);
	for i=1:8
		bit_one = bitget(first_bin,i);
		for j=1:8
			bit_second = bitget(second_bin,j);
			if~(-j+5 >=i)
				matrix(i,j) = and(bit_second,bit_one);
			end
		end
	end
end

