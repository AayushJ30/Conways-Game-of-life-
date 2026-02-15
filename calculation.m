clc;
clear;
close all;

mapSize = 50;




%random starting pattern 
function corrected = RandomZO(mapSize)    
    A = rand(mapSize);
    for i=1:mapSize
        for j=1:mapSize
            if A(i,j) > .5
                A(i,j) = 1;
            else 
                A(i,j) = 0;
            end 
        end 
    end
corrected = A;
end 

function newNumber = numberAlive(i, j, matrix)
    kernal = [1 1 1; 1 0 1; 1 1 1;];
    neighbor = conv2(matrix, kernal, "same");
    newNumber = neighbor(i,j);
end



function nextGen = process(matrix, mapSize)
    C = matrix;
    for i=1:mapSize
        for j=1:mapSize
            if matrix(i,j) == 1 & numberAlive(i,j,C) == 3
                nextGen(i,j) = 0; % Cell becomes alive
            end

            if matrix(i,j) == 0 & (numberAlive(i,j,C) > 3 | numberAlive(i,j,C) <2)
                nextGen(i,j) = 1; % Cell dies
            end
        end
    end
end



A = ones(mapSize);


% Display the generated map as an image

figure;
h = imagesc(A);
colormap(gray);
axis equal tight;
title('Random Binary Map');


while true
    A = process(A, mapSize);
    set(h,'CData',A);
    drawnow;
    pause(1);
end
  
    