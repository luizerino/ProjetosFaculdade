function VALID = validacao(vet1,vet2,zas)
  if(zas)
    aux = 0;
      for z=1:9
        if(vet1(z) != vet2(z))
          aux++;
        endif
      endfor
    if(aux>8)
      VALID = false;
      return;
    else
      VALID = true; 
      return;
    endif
  else
    VALID = false; 
    return;
  endif
endfunction 