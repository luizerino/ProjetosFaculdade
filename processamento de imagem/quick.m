#quicksort
function c=quick(v,start,fim)
  pivo = v(start);
  i = start;
  f = fim;
  while(i<=f)
    while(v(i)<pivo)
      i++;
    endwhile
    while(v(f)>pivo)
      f--;
    endwhile
    if(f>=i)
      aux=v(i);
      v(i) = v(f);
      v(f) = aux;
      i++;
      f--;
    endif
  endwhile
  if(start<f)
    quick(v,start,f);
  endif
  if(i<fim)
    quick(v,i,fim);
  endif
  c = v;
endfunction



  