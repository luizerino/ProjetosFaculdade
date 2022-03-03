I = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\5.jpg');

#cadastro joão
I2 = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\17.jpg');
I2valid = 0;
I2nome = "joão";
I2saldo = 25000;

#cadastro caio
I3 = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\20.jpg'); 
I3valid = 0;
I3nome = "caio";
I3saldo = 1500;

IMIL = I;

a = true;

[l c] = size(I);


for x = 1:l 
  for y = 1:c 
    

    # tranformar a I em bi-nível
    if(I(x, y)< 128)
      I(x, y) = 0;
    else
      I(x, y) = 250;
    endif
    
    # tranformar a I2 em bi-nível
     if(I2(x, y)< 128) 
      I2(x, y) = 0;
    else
      I2(x, y) = 250;
    endif
    
     #tranformar a I3 em bi-nível
     if(I3(x, y)< 128)
      I3(x, y) = 0;
    else
      I3(x, y) = 250;
    endif
    

    # comparando pixel I1 com I2
    if(I(x, y) != I2(x, y))
      I2valid++;
    endif
    
    # comparando pixel I1 com I3
     if(I(x, y) != I3(x, y))
      I3valid++;
    endif
    IMIL = abs(I(x,y) - I2(x,y));
  endfor
endfor


disp(I2valid);
disp(I3valid);
if (I2valid<10)
   printf("olá %s! \nseu saldo é atual é de: %d reais\n",I2nome,I2saldo);
 
elseif(I3valid<10)
   printf("olá %s! \nseu saldo é atual é de: %d reais\n",I3nome,I3saldo);

else 
   printf("digital não cadastrada!\n")
endif
figure,imshow(I);
figure,imshow(I2);
figure,imshow(I3);
figure,imshow(IMIL);