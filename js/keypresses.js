$(document).bind('keypress', function(e){
   if(e.key == 'u') {
     up()
   }
});

$(document).bind('keypress', function(e){
   if(e.key == 'd') {
     down()
   }
});

$(document).bind('keypress', function(e){
   if(e.key == 'f') {
     bodyFullScreen()
   }
});

$(document).bind('keypress', function(e){
   if(e.key == 'r') {
     fill(cSize, true)
   }
});

$(document).bind('keypress', function(e){
    x = document.getElementById('sizeOf20')
   if(e.key == '+' && x.style.display == 'inline') {
     localStorage.pxsize++;
     fill(cSize)
   }
});

$(document).bind('keypress', function(e){
    x = document.getElementById('sizeOf20')
   if(e.key == '-' && x.style.display == 'inline') {
     localStorage.pxsize--;
     fill(cSize)
   }
});

$(document).bind('keypress', function(e){
  if(e.key == '@') {
    e = document.getElementById('sizeOf20')

    if (e.style.display == 'none') {
      e.style.display = 'inline'
    } else {
      e.style.display = 'none'
    }
  }
});

$(document).bind('keypress', function(e){
   if(e.key == 'm') {
     if (mode == 'letter') {
       mode = 'number'
       fill(cSize)
       return
     }
     if (mode == 'number') {
       mode = 'symbol'
       fill(cSize)
       return
     }
     if (mode == 'symbol') {
       mode = 'e'
       fill(cSize)
       return
     }
     if (mode == 'e') {
       mode = 'letter'
       fill(cSize)
       return
     }
   }
});

$(document).bind('keypress', function(e){
   if(e.key == '!') {
     vt = document.getElementsByClassName('visionTest')[0]

     if (parseInt(localStorage.mirrored)) {
       vt.classList.remove('mirrored')
       localStorage.mirrored = 0
     } else {
       vt.classList.add('mirrored')
       localStorage.mirrored = 1
     }
   }
});

$(document).bind('keypress', function(e){
  if(e.key == 'l') {
    if (multiLine) {
      multiLine = false
    } else {
      multiLine = true
    }
    fill(cSize)
  }
});

$(document).bind('keypress', function(e){
   if(['1', '2', '3', '4', '5', '6', '7', '8', '9'].includes(e.key)) {
     if (e.key === '1') {fill(1)}
     if (e.key === '2') {fill(3)}
     if (e.key === '3') {fill(5)}
     if (e.key === '4') {fill(6)}
     if (e.key === '5') {fill(8)}
     if (e.key === '6') {fill(10)}
     if (e.key === '7') {fill(11)}
     if (e.key === '8') {fill(14)}
     if (e.key === '9') {fill(17)}
   }
});

