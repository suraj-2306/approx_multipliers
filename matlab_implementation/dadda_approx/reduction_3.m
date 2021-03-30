function [matrix] = reduction_3(ma2);
	ma3 = zeros(2,11);

	%first col
	[ma3(1,2),ma3(1,1)] = comp4_2(ma2(1,1),ma2(2,1),ma2(3,1),ma2(4,1));

	%2 col
	[ma3(1,3),ma3(2,2)] = comp4_2(ma2(1,2),ma2(2,2),ma2(3,2),ma2(4,2));
	
	%3rd col
	[ma3(1,4),ma3(2,3)] = comp4_2(ma2(1,3),ma2(2,3),ma2(3,3),ma2(4,3));

	%4th col
	[ma3(1,5),ma3(2,4)] = comp4_2(ma2(1,4),ma2(2,4),ma2(3,4),ma2(4,4));
	
	%5th col
	[ma3(1,6),ma3(2,5)] = comp4_2(ma2(1,5),ma2(2,5),ma2(3,5),ma2(4,5));
	
	%6th col
	[ma3(1,7),ma3(2,6)] = comp4_2(ma2(1,6),ma2(2,6),ma2(3,6),ma2(4,6));

	%7th col
	[ma3(1,8),ma3(2,7)] = comp4_2(ma2(1,7),ma2(2,7),ma2(3,7),ma2(4,7));

	%8th col
	[ma3(1,9),ma3(2,8)] = comp4_2(ma2(1,8),ma2(2,8),ma2(3,8),ma2(4,8));

	%9th col
	[ma3(1,10),ma3(2,9)] = comp4_2(ma2(1,9),ma2(2,9),ma2(3,9),ma2(4,9));

	%10 col
	[ma3(1,11),ma3(2,10)] = comp2_2(ma2(1,10),ma2(2,10));

	%11th col
	ma3(2,11) = ma2(1,11);

	matrix = ma3;
end
