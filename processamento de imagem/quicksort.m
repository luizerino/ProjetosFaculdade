#quicksort

#primeira parte
function pontoT=comprimento(v,ini,fim)
  pivo = v(fim);
  pontoTroca = ini;
  for J = ini:fim-1
    if(v(J)<=pivo)
      aux = v(J);
      v(J) = v(pontoTroca);
      v(pontoTroca) = aux;
      pontoTroca++
    endif
  endfor
  aux = v(pontoTroca);
  v(pontoTroca) = v(fim);
  v(fim) = aux;
  pontoT = pontoTroca;
endfunction
#segunda parte
function c=quicksort(Z,init2,fim2)
  if(ini2 < fim2)
    p = comprimento(Z,init2,fim2);
    quicksort(Z,init2,p-1);
    quicksort(Z,p+1,fim2);
  endif
 
endfunction
