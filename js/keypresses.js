fullscreen = false
sizenum = true


$(document).bind('keypress', function(e){
   if(e.key == 'n') {
     tglSizeNum()
   }
});

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
   if(e.key == 'c') {
     fill("calibration")
   }
});

$(document).bind('keypress', function(e){
  b = document.getElementById('body')
   if(e.key == 'f') {
     if (!fullscreen) {fullscreen=true;bodyFullScreen();b.classList.add('nocursor');return}
     if (fullscreen) {fullscreen=false;document.exitFullscreen();b.classList.remove('nocursor');return}
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
     upPxSize()
   }
});

$(document).bind('keypress', function(e){
   x = document.getElementById('sizeOf20')
   if(e.key == '-' && x.style.display == 'inline') {
     downPxSize()
   }
});

$(document).bind('keypress', function(e){
  if(e.key == '@') {
    toggleSizeOf20()
  }
});

$(document).bind('keypress', function(e){
   if(e.key == 'm') {
     tglMode()
   }
});

$(document).bind('keypress', function(e){
   if(e.key == 's') {
     tglSingle()
   }
});

$(document).bind('keypress', function(e){
   if(e.key == '!') {
     toggleMirror()
   }
});

$(document).bind('keypress', function(e){
  if(e.key == 'l') {
    tglLine();
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

