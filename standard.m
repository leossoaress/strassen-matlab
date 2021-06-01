function [y] = standard(a, b)

y = zeros(size(a));

for i = 1:size(a,1)
    for j = 1:size(a,2)
        temp = 0;
        for k = 1:size(a,2)
            temp = temp + (a(i,k) * b(k,j));
        end
        y(i,j) = temp;
    end
end

end