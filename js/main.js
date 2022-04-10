function getRand(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
}
function bodyFullScreen() {
  document.getElementsByTagName('html')[0].requestFullscreen()
}
function clearAll() {
  x=1
  while (x < 6) {
    for (let i = 0; i < 6; i++) {
      e = document.getElementById(`r${x}c${i+1}`)
      e.style.display = 'none'
    }

    x++
  }
}
function drawLine(r, type, letters) {
  images = []

  for (let i = 0; i < 6; i++) {
    e = document.getElementById(`r${r}c${i+1}`)
    e.src=''
  }

  for (let i = 0; i < letters.length; i++) {
    e = document.getElementById(`r${r}c${i+1}`)
    images[i] = e
  }

  usedLetters = []

  for (let n = 0; n < images.length; n++) {
    i = images[n]

    l = letters[n]

    i.src = `photos/normal/${l}i60.bmp`
    i.style.display = 'inline'
  }

  return true
}

function line(r, size) {
  drawLine(r, 'normal', lettersInLine(size))

  if (r==1) {document.getElementById('size').innerHTML = size}

  setRowSize(r, (sizeOf10() * (size/10)))
}

function setRowSize(row, size) {
  x=1

  while (x < 7) {
    e = document.getElementById(`r${row}c${x}`)

    if (e.src.split('/')[e.src.split('/').length-1] != 'index.html') {
      e.height = parseInt(size)
      e.width = parseInt(size)
    }
    x++
  }
}

function fill(size) {
  clearAll();

  if (size == '1') {
    line(1, 10)
  }
  if (size == '2') {
    line(1, 15)
    line(2, 10)
  }
  if (size == '3') {
    line(1, 20)
    line(2, 15)
    line(3, 10)
  }
  if (size == '4') {
    line(1, 25)
    line(2, 20)
    line(3, 15)
    line(4, 10)
  }
  if (size == '5') {
    line(1, 30)
    line(2, 25)
    line(3, 20)
    line(4, 15)
  }
  if (size == '6') {
    line(1, 40)
    line(2, 30)
    line(3, 25)
    line(4, 20)
  }
  if (size == '7') {
    line(1, 50)
    line(2, 40)
    line(3, 30)
  }
  if (size == '8') {
    line(1, 60)
    line(2, 50)
    line(3, 40)
  }
  if (size == '9') {
    line(1, 70)
    line(2, 60)
  }
  if (size == '10') {
    line(1, 80)
    line(2, 70)
  }
  if (size == '11') {
    line(1, 100)
    line(2, 80)
  }
  if (size == '12') {
    line(1, 125)
  }
  if (size == '13') {
    line(1, 150)
  }
  if (size == '14') {
    line(1, 200)
  }
  if (size == '15') {
    line(1, 250)
  }
  if (size == '16') {
    line(1, 300)
  }
  if (size == '17') {
    line(1, 400)
  }
  if (size == '18') {
    line(1, 500)
  }
  if (size == '19') {
    line(1, 630)
  }
  if (size == '20') {
    line(1, 800)
  }

  return true
}
