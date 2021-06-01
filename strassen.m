function [y] = strassen(a, b)

if(size(a,1) == 1)
    y = a * b;
    return;
end
    
n = size(a,1) / 2;
m = size(a,1);

a1 = a(1:n,1:n);
b1 = a(1:n,n+1:m);
c1 = a(n+1:m,1:n);
d1 = a(n+1:m,n+1:m);

a2 = b(1:n,1:n);
b2 = b(1:n,n+1:m);
c2 = b(n+1:m,1:n);
d2 = b(n+1:m,n+1:m);

p1 = strassen(a1, b2 - d2);
p2 = strassen(a1 + b1, d2);
p3 = strassen(c1 + d1, a2);
p4 = strassen(d1, c2 - a2);
p5 = strassen(a1 + d1, a2 + d2);
p6 = strassen(b1 - d1, c2 + d2);
p7 = strassen(a1 - c1, a2 + b2);

c11 = p5 + p4 - p2 + p6;
c12 = p1 + p2;
c21 = p3 + p4;
c22 = p1 + p5 - p3 - p7;

y = [c11,c12;c21,c22];

end