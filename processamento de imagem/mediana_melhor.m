pkg load image
clc;clear;close all;
I1=imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\2.jpg');
subplot(1,2,1)
imshow(I1);
K=1;
I2=padarray(I1,[K K],'replicate');
[m n] = size(I1);
for i=2:(m-1)
  for j=2:(n-1)
    v=I1(i-1:i+1,j-1:j+1);
    R=(sum(v(:)))/9;
    C(i-1,j-1) = uint8(ceil(R));
  endfor
endfor
subplot(1,2,2)
imshow(C);
