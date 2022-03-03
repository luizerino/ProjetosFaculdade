function imResult = preprocessamento(im)
  [l c] = size(im);
  #suavisar imagem pelo metodo da media
  im = imsmooth(im,"Average");
  #tranformar em imagem binária
    for x = 1:l
      for y = 1:c
        if(im(x, y)< 128)
        im(x, y) = 0;
        else
          im(x, y) = 250;
        endif
      endfor
    endfor
  imResult = im;
  return;
endfunction
