I = imread('imagem.jpg');
imshow(I);
G = I;
[L C] = size(I);
for x=2:L-1
  for y=2:C-1
    vetor =[I(x-1,y-1),I(x-1,y),I(x-1,y+1),I(x,y-1),I(x,y),I(x,y+1),I(x+1,y-1),I(x+1,y),I(x+1,y+1)];
    for i=1:8
      for j=1:8
        if(vetor(j)>vetor(j+1))
          aux = vetor(j);
          vetor(j) = vetor(j+1);
          vetor(j+1) = aux;
        endif
      endfor
    endfor 
    G(x,y) = vetor(5);
  endfor
endfor



