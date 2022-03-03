function imResult = preprocessamento(im)
  #suavisar imagem pelo metodo da media
  im = imsmooth(im,"Average");
  #tranformar em imagem binária
  im = im2bw(im);
  #fazer o processo de thinning
  im = bwmorph(im,"thin",Inf);
  imResult = im;
  return;
endfunction

#{
 for x = 1:l 
    for y = 1:c 
      if(im1(x, y)< 128)
      im1(x, y) = 0;
      else
        im1(x, y) = 250;
      endif
    endfor
  endfor
#}