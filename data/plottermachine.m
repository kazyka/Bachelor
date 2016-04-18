function plottermachine(data, variable)


%Distance 1 til 10 for X 0 til 135 grader
A = zeros(40,1);
for i=1:10
    A(i)    = getfield(data{1+(12*(i-1))}, variable);
    A(10+i) = getfield(data{2+(12*(i-1))}, variable);
    A(20+i) = getfield(data{3+(12*(i-1))}, variable);
    A(30+i) = getfield(data{4+(12*(i-1))}, variable);
end
subplot(3,4,1)
plot(A(1:10,1), '.');
title({'X distance 1-10', 'degree 0'})
axis([0 10 0 2.5*10^6])

subplot(3,4,2)
plot(A(11:20,1), '.');
axis([0 10 0 2.5*10^6])

subplot(3,4,3)
plot(A(21:30,1), '.');
axis([0 10 0 2.5*10^6])

subplot(3,4,4)
plot(A(31:40,1), '.');
axis([0 10 0 2.5*10^6])



%Distance 1 til 10 for Y 0 til 135 grader
A = zeros(40,1);
for i=1:10
    A(i)    = getfield(data{5+(12*(i-1))}, variable);
    A(10+i) = getfield(data{6+(12*(i-1))}, variable);
    A(20+i) = getfield(data{7+(12*(i-1))}, variable);
    A(30+i) = getfield(data{8+(12*(i-1))}, variable);
end
subplot(3,4,5)
plot(A(1:10,1), '.');
title({'X distance 1-10', 'degree 0'})
axis([0 10 0 5*10^3])

subplot(3,4,6)
plot(A(11:20,1), '.');
axis([0 10 0 5*10^3])

subplot(3,4,7)
plot(A(21:30,1), '.');
axis([0 10 0 5*10^3])

subplot(3,4,8)
plot(A(31:40,1), '.');
axis([0 10 0 5*10^3])


%Distance 1 til 10 for Z 0 til 135 grader
A = zeros(40,1);
for i=1:10
    A(i)    = getfield(data{9+(12*(i-1))}, variable);
    A(10+i) = getfield(data{10+(12*(i-1))}, variable);
    A(20+i) = getfield(data{11+(12*(i-1))}, variable);
    A(30+i) = getfield(data{12+(12*(i-1))}, variable);
end
subplot(3,4,9)
plot(A(1:10,1), '.');
title({'Z distance 1-10', 'degree 0'})
axis([0 10 0 5*10^3])

subplot(3,4,10)
plot(A(11:20,1), '.');
title({'Z distance 1-10', 'degree 0'})
axis([0 10 0 5*10^3])

subplot(3,4,11)
plot(A(21:30,1), '.');
title({'Z distance 1-10', 'degree 0'})
axis([0 10 0 5*10^3])

subplot(3,4,12)
plot(A(31:40,1), '.');
title({'Z distance 1-10', 'degree 0'})
axis([0 10 0 5*10^3])

figure;
