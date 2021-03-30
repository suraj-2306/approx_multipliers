function [matrix] = reduction_4(ma3);
	ma4 = zeros(1,16);

	%first col
	ma4(1,5) = ma3(1,1);

	%2 col
	[ca1,ma4(1,6)] = comp2_2(ma3(1,2),ma3(2,2));

	%3rd col
	[ca2,ma4(1,7)] = comp3_2(ca1,ma3(1,3),ma3(2,3));

	%4th col
	[ca3,ma4(1,8)] = comp3_2(ca2,ma3(1,4),ma3(2,4));

	%5th col
	[ca4,ma4(1,9)] = comp3_2(ca3,ma3(1,5),ma3(2,5));

	%6th col
	[ca5,ma4(1,10)] = comp3_2(ca4,ma3(1,6),ma3(2,6));

	%7th col
	[ca6,ma4(1,11)] = comp3_2(ca5,ma3(1,7),ma3(2,7));

	%8th col
	[ca7,ma4(1,12)] = comp3_2(ca6,ma3(1,8),ma3(2,8));

	%9th col
	[ca8,ma4(1,13)] = comp3_2(ca7,ma3(1,9),ma3(2,9));

	%10 col
	[ca9,ma4(1,14)] = comp3_2(ca8,ma3(1,10),ma3(2,10));

	%11th col
	[ca10,ma4(1,15)] = comp3_2(ca9,ma3(1,11),ma3(2,11));

	%12th col
	ma4(1,16) = ca10;
	matrix = ma4;
end
