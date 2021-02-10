function [rounded] = rounding(number,m)
	number = int16(number);
	index_number = bitget(number,m+1);
	number  =bitshift(number,-(m));
	if m>0
		if index_number == 0
			rounded = number;
		elseif index_number == 1
			rounded  = -bitcmp(number);
		end
	elseif m==0
		rounded = number;
	end
	rounded = bitshift(rounded,(m));
end
