pkg load image
#imagem que está entrando
I = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\5.jpg');
IT = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\20.jpg');


[i c] = size(I);
I3 = im2bw(I);
I4 = im2bw(IT);
I3 = bwmorph(I3,"thin",Inf);
I4 = bwmorph(I3,"thin",Inf);
I5 = I4;


for x=1:i
  for y=1:c
    I5(x,y) = I4(x,y) - I3(x,y);
  endfor
endfor
#{
for x = 3:l-2
  for y = 3:c-2
    vevet= [I(x-2,y-2),I(x-1,y-2),I(x,y-2),I(x+1,y-2),I(x+2,y-2),
            I(x-2,y-1),I(x-1,y-1),I(x,y-1),I(x+1,y-1),I(x+2,y-1),
            I(x-2,y),  I(x-1,y),  I(x,y),  I(x+1,y),  I(x+2,y),
            I(x-2,y+1),I(x-1,y+1),I(x,y+1),I(x+1,y+1),I(x+2,y+1),
            I(x-2,y+2),I(x-1,y+2),I(x,y+2),I(x+1,y+2),I(x+2,y+2),];
            
            IT(x,y) = hitmiss(vevet);
  endfor
endfor
#}


figure,imshow(I5);