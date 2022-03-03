I = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\5.jpg');
#cadastro joão
I2 = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\17.jpg');
I2valid = true;
I2nome = "joão";
I2saldo = 25000;



[l c] = size(I);


for x = 1:l 
  for y = 1:c 
    
    #tranformar a I em bi-nível
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
  endfor
endfor

for x = 1:l-2 
  for y = 1:c-2 
 #vetor vI importante
    vI = [I(x,y),I(x+1,y),I(x+2,y),I(x,y+1),I(x+1,y+1),I(x+2,y+1),I(x,y+2),I(x+1,y+2),I(x+2,y+2)];
	  #validação da imagem I2
	  vI2 = [I2(x,y),I2(x+1,y),I2(x+2,y),I2(x,y+1),I2(x+1,y+1),I2(x+2,y+1),I2(x,y+2),I2(x+1,y+2),I2(x+2,y+2)];
    I2valid = validacao(vI,vI2,I2valid);

  endfor
endfor
figure,imshow(I);
figure,imshow(I2);
if (I2valid)
   printf("olá %s! \nseu saldo é atual é de: %d reais\n",I2nome,I2saldo);
else 
   printf("digital não cadastrada!\n")
endif