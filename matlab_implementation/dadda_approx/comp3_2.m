function [return_carry,return_sum] = copm3_2(x1,x2,x3)
	return_sum = xor(x1,xor(x2,x3)) ;
	return_carry = or(and(x1,x2),or(and(x1,x3),and(x2,x3))) ;
end

