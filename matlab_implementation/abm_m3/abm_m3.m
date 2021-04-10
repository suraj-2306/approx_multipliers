function sum_answer = abm_m3(A,B,m)
	A = int32(A);
	B = int32(B);
	a = bitget(A,1:16,'int32');
	b = bitget(B,1:16,'int32');
	pp_matrix = zeros(8,19);
	[sign_array,pp_matrix] = pp_gen_m(a,b,m);

	sum_matrix = zeros(9,32);
	sum_answer = int64(0);
	%making the 19*8 matrix into a 32*8 one
	for i=1:8
		sum_matrix(i,(i-1)*2+1:(19+(i-1)*2)) =  pp_matrix(i,:);
	end
	sum_matrix = sum_matrix(:,1:32);

	% for m bit approximation
	for i=1:8
		m_bit = 0;
		for j=1:m
			if(sum_matrix(i,j)==1)
				m_bit = 1;
			end
			sum_matrix(i,j) = 0;
		end
		if m>0
			sum_matrix(i,(m)) = m_bit;
		end
		m_bit;
	end
	%correction number
	%sign_array
	for j=(m/2+1):8
		sum_matrix(j+1,2*j-1)=sign_array(j);
	end

	%for debugging
	%fliplr(sum_matrix)
	for i=1:9
		sum_answer =  sum_answer + arr2dec(sum_matrix(i,1:32));
	end
	%for debugging
	%bitget(sum_answer,1:32,'int64');
	sum_answer = arr2dec(bitget(sum_answer,1:32,'int64'));
end
