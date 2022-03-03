function valor = hitmiss(vetor)
  
  for i=1:25
    if(vetor(i)!= 0)
    valor = 250;
    return
    endif
  endfor
  valor = 0;
  return
endfunction