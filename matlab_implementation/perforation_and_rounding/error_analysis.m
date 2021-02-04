function [MRED] = error_analysis(A,B,m,k)
	RED =0.000;
	%result = booth_multiplier_radix_2(rounding(A,m),perforation(B,k));
	for j=-32768:32767
		for i = -32768:32767
			RED = RED+ abs(i*j - booth_multiplier_radix_2(rounding(i,m),perforation(j,k)))/abs(i*j)
		end
	end
	MRED = double(RED/2^16);
end
	
