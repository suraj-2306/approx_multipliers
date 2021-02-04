function [rounded] = rounding(number,m)
	number = int16(number);
	index_number = bitget(number,m+1);
	number  =bitshift(number,-(m));
	if index_number == 0
		rounded = number;
	elseif index_number == 1
		rounded  = -bitcmp(number);
	end
	rounded = bitshift(number,(m));
end
