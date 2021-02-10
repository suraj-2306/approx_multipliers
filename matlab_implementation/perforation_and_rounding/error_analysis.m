function [MRED] = error_analysis(A,B,m,k)
	resolution = 1024;
	tic
	RED =0.000;
	RED = double(RED);
	%result = booth_multiplier_radix_2(rounding(A,m),perforation(B,k));
	for j=-resolution:resolution-1
		for i = -resolution:resolution-1
			RED = RED+ abs(i*j - booth_multiplier_radix_2(rounding(i,m),perforation(j,k)))/abs(i*j)
		end
	end
	MRED = double(RED/2^16);
	timeElapsed = toc
end
	
