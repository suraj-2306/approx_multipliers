function [return_carry,return_sum] = comp(x1,x2)
	return_sum = xor(x1,x2);
	return_carry = and(x1,x2);
end
