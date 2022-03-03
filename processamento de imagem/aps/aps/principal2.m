pkg load image
I = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\t2.jpg');

I2 = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\t2.jpg');

getAnomalia = false;

[l c] = size(I);

I = preprocessamento(I);
I2 = preprocessamento(I2);

#imagem subtraída
for x = 1:l 
  for y = 1:c 
    ImSubtract(x,y) = (abs(I(x,y)-I2(x,y)));
  endfor
endfor

#verificar anomalia imagem 1
for x = 1:l-2 
   if(getAnomalia)
      break;
    endif
  for y = 1:c-2
    if(!getAnomalia)
    vetorComparacao =[ImSubtract(x,y),  ImSubtract(x+1,y),  ImSubtract(x+2,y),  
                      ImSubtract(x,y+1),ImSubtract(x+1,y+1),ImSubtract(x+2,y+1),
                      ImSubtract(x,y+2),ImSubtract(x+1,y+2),ImSubtract(x+2,y+2)];
    getAnomalia = findAnomalia(vetorComparacao);
  endif
  
    if(getAnomalia)
      break;
    endif
  endfor
endfor
    
#outputs
if(!getAnomalia)
  subplot(1,2,1);
  imshow(I);
  subplot(1,2,2);
  title({"digitais são iguais"});
  imshow(I2);
  printf("as digitais são iguais\n");
else
   subplot(1,2,1);
  imshow(I);
  subplot(1,2,2);
  title({"digitais não são iguais"});
  imshow(I2);
  printf("as digitais não são iguais\n");
endif
