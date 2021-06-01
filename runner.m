function [] = runner(filename)

fileID = fopen(filename,'r');
input = fscanf(fileID, '%d');
fclose(fileID);

kmax = input(1);
r = input(2);
Amin = input(3);
Amax = input(4);

strassenResults = zeros(kmax - 5);
standardResults = zeros(kmax - 5);

for k = 5:kmax
    
    strassenCount = 0;
    standardCount = 0;
    
    for i = 1:r
        x = randi([Amin Amax], 2.^k, 2.^k);
        y = randi([Amin Amax], 2.^k, 2.^k);
        
        tic
        strassen(x,y);
        strassenCount = strassenCount + toc;
        
        tic
        standard(x,y);
        standardCount = standardCount + toc;
    end
    
    strassenResults(k-5+1) = strassenCount/r;
    standardResults(k-5+1) = standardCount/r;
        
end

x = 5:kmax;

figure1 = figure;
subplot(2,1,1);
plot(x,strassenResults)
title('Strassen Time Execution')
xlabel('Potência de 2 que equivale ao tamanho da matriz') 
ylabel('Tempo de execução (s)') 

subplot(2,1,2);
plot(x,standardResults)
title('Standard Time Execution')
xlabel('Potência de 2 que equivale ao tamanho da matriz') 
ylabel('Tempo de execução (s)') 

exportgraphics(figure1,'output.png')

end