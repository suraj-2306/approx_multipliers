function [result] = perforation(number,k)
	number = int16(number);
	result = bitshift(number,-(2*k-1));
	result = bitshift(result,(2*k-1));
end
