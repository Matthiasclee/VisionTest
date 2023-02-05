function upRoomLength() {
  localStorage.roomLength++;
  fill(cSize)
}

function downRoomLength() {
  localStorage.roomLength--;
  fill(cSize)
}

function upPxSize() {
  localStorage.pxsize++;
  fill(cSize)
}

function downPxSize() {
  localStorage.pxsize--;
  fill(cSize)
}

function toggleMirror() {
  vt = document.getElementsByClassName('visionTest')[0]

  if (parseInt(localStorage.mirrored)) {
    vt.classList.remove('mirrored')
    localStorage.mirrored = 0
  } else {
    vt.classList.add('mirrored')
    localStorage.mirrored = 1
  }
}

