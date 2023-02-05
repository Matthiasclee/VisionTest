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

function toggleSizeOf20() {
  e = document.getElementById('sizeOf20')

  if (e.style.display == 'none') {
    e.style.display = 'inline'
  } else {
    e.style.display = 'none'
  }
}

function toggleRoomLength() {
  e = document.getElementById('roomLength')

  if (e.style.display == 'none') {
    e.style.display = 'inline'
  } else {
    e.style.display = 'none'
  }
}
