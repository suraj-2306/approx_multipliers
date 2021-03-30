function [return_carry,return_sum] = copm4_2(x1,x2,x3,x4)
	return_sum = not(and(not(or(x1,x2)),not(or(x3,x4))));
	return_carry = not(or(not(or(x1,x2)),not(or(x3,x4))));
end

