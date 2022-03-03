#fazer isso l x c vezes 
function anomDetect = findAnomalia(vetImg,anomalia)
    for i=1:9
      if(vetImg(i) != 250)
        anomDetect = false;
        return;
      endif
    endfor
    anomDetect = true;
    return;

endfunction