I = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\5.jpg');
figure,imshow(I);
title ({"imagem original"});
G = I;
Z = I;
D = I;
xis = I;
[L C] = size(I);

#filtro passa-baixa pelo metodo da m�dia
for x=2:L-1
  for y=2:C-1
    G(x,y) = (double(I(x-1,y-1)) + double(I(x-1,y)) + double(I(x-1,y+1)) + double(I(x,y-1)) + double(I(x,y)) + double(I(x,y+1)) + double(I(x+1,y-1)) + double(I(x+1,y))+ double(I(x+1,y+1)))/9;
  endfor
endfor
figure,imshow(G);
title ({"imagem borrada (suavisada)"});

# m�scara hight-boost que consiste em subtrair o filtro passa-baixa da imagem original e multiplicar pelo fator de amplifica��o(A)
A = 2;
for x=1:L
  for y=1:C
    Z(x,y) = A*(I(x,y) - G(x,y));
  endfor
endfor
figure,imshow(Z);
title ({"imz"});

A = 2;
for x=1:L
  for y=1:C
    xis(x,y) = 256 - xis(x,y);
  endfor
endfor
figure,imshow(xis);
title ({"imz"});

# aplicando a m�scara na imagem original criando a imagem agu�ada
for x=1:L
  for y=1:C
    D(x,y) = (I(x,y) + Z(x,y));
  endfor
endfor
figure,imshow(D);
title ({"imagem original + m�scara"});