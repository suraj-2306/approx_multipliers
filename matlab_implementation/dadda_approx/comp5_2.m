function [return_carry,return_sum] = comp5_2(x1,x2,x3,x4,x5)
	return_sum = not(and(not(or(x1,x2)),and(not(or(x3,x4)),not(x5))));
	return_carry = not(or(not(or(x1,x2)),not(or(x3,x4))));
end

