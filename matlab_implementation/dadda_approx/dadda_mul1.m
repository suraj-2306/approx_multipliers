function [sum_answer] = dadda_mul1(first_bin,second_bin)
	sum_answer=0;
	answer = reduction_4(reduction_3(reduction_2_a(reduction_1(first_bin,second_bin))));
	for i=1:16
		sum_answer = answer(i)*2^(i-1) + sum_answer;
	end
end
