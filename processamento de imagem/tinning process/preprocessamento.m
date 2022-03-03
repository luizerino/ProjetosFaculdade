function imResult = preprocessamento(im1)
  #suavisar imagem pelo metodo da media
  imsmooth(im1,"Average");
  [l c] = size(im1);
  #tranformar em imagem binária
  for x = 1:l 
    for y = 1:c 
      if(im1(x, y)< 128)
      im1(x, y) = 0;
      else
        im1(x, y) = 250;
      endif
    endfor
  endfor
  imResult = im1;
  return;
endfunction