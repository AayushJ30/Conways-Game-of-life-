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

A = RandomZO(mapSize);
% Display the generated map as an image

figure;
h = imagesc(A);
colormap(gray);
axis equal tight;
title('Random Binary Map');


while true
    A = RandomZO(mapSize);
    set(h,'CData',A);
    drawnow;
    pause(0.1);
end
  
    