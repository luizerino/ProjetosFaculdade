pkg load image
#imagem que está entrando
I = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\t1.jpg');

#cadastro caio
I2 = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\t3.jpg');
I2nome = "caio";
I2saldo = 20000;
ImSubtract=I;
getAnomalia = false;

#cadastro joão
I3 = imread('D:\_NaoApagarNunca\Desktop\unip_4semestre\processamento de imagem\t2.jpg');
I3nome = "joão";
I3saldo = 25000;
ImSubtract2=I;
getAnomalia2 = false;

a = true;

[l c] = size(I);

I = preprocessamento(I);
I2 = preprocessamento(I2);
I3 = preprocessamento(I3);

#imagem subtraída
for x = 1:l 
  for y = 1:c 
    ImSubtract(x,y) = (abs(I(x,y)-I2(x,y)));
    ImSubtract2(x,y) = (abs(I(x,y)-I3(x,y)));
  endfor
endfor

#verificar anomalia imagem 1
for x = 1:l-5 
   if(getAnomalia && getAnomalia2)
      break;
    endif
  for y = 1:c-5

  #I2
    if(!getAnomalia)
    vetorComparacao =[ImSubtract(x,y),  ImSubtract(x+1,y),  ImSubtract(x+2,y),  
                      ImSubtract(x,y+1),ImSubtract(x+1,y+1),ImSubtract(x+2,y+1),
                      ImSubtract(x,y+2),ImSubtract(x+1,y+2),ImSubtract(x+2,y+2)];
    getAnomalia = findAnomalia(vetorComparacao);
  endif
  

    #I3
     if(!getAnomalia2)
    vetorComparacao = [ImSubtract2(x,y),  ImSubtract2(x+1,y),  ImSubtract2(x+2,y),  
                      ImSubtract2(x,y+1),ImSubtract2(x+1,y+1),ImSubtract2(x+2,y+1),
                      ImSubtract2(x,y+2),ImSubtract2(x+1,y+2),ImSubtract2(x+2,y+2)];
    getAnomalia2 = findAnomalia(vetorComparacao);
    endif
  
    if(getAnomalia && getAnomalia2)
      break;
    endif
  endfor
endfor
    
#outputs
if(!getAnomalia)
  printf("olá %s, bem vindo!\nsaldo atual da conta bancária: %d\n",I2nome,I2saldo);
elseif(!getAnomalia2)
  printf("olá %s, bem vindo!\nsaldo atual da conta bancária: %d\n",I3nome,I3saldo);
else
  printf("digital não está cadastrada!!!\n");
endif
figure,imshow(I);
title("imagem de entrada")
figure,imshow(I2);
title("imagem 1")
figure,imshow(ImSubtract);
title("imagem de entrada - imagem 1")
figure,imshow(I3);
title("imagem 2")
figure,imshow(ImSubtract2);
title("imagem de entrada - imagem 2")