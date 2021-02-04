function [result] = error_analysis(A,B,m,k)
	rounding(A,m);
	perforation(B,k);
	result = booth_multiplier_radix_2(rounding(A,m),perforation(B,k))
	result = booth_multiplier_radix_4(rounding(A,m),perforation(B,k))
end
	
