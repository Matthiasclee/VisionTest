var mode = 'letter'
var sgl = false
var cSize = 1
var multiLine = true


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
      e.style.transform = "rotate(0deg)";
    }

    x++
  }
}

function drawLine(r, type, letters, spacing, random = false) {
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

    if (mode != 'letter') {random = false}

    i.style.marginLeft = `${spacing}px`
    i.style.marginRight = `${spacing}px`
    i.style.marginTop = `${spacing}px`
    i.style.marginBottom = `${spacing}px`

    if (!random) {
      if (mode == 'letter') {
        i.src = `photos/normal/${l.toLowerCase()}i60.bmp`
      } else if (mode == 'number') {
        nums = [2, 3, 4, 5, 6, 7, 9]

        foundGoodLetter = false
        while (!foundGoodLetter) {
          possible = nums[getRand(0, nums.length-1)]

          if (!usedLetters.includes(possible)) {
            l = possible
            foundGoodLetter = true
            usedLetters[usedLetters.length] = l
          }
        }

        i.src = `photos/numbers/${l}i60.bmp`
      } else if (mode == 'symbol') {
        nums = [1, 2, 3, 4, 5, 6, 7, 9]

        foundGoodLetter = false
        while (!foundGoodLetter) {
          possible = nums[getRand(0, nums.length-1)]

          if (!usedLetters.includes(possible)) {
            l = possible
            foundGoodLetter = true
            usedLetters[usedLetters.length] = l
          }
        }
        i.src  = `photos/symbols/s${l}i60.bmp`
      } else if (mode == 'e') {
        i.src = 'photos/rotating_e/ei60.bmp'

        rotations = ['0', '90', '180', '270']

        foundGoodLetter = false
        while (!foundGoodLetter) {
          possible = rotations[getRand(0, rotations.length-1)]

          if (!usedLetters.includes(possible)) {
            l = possible
            foundGoodLetter = true
            usedLetters[usedLetters.length] = l
          }
        }
        i.style.transform = `rotate(${l}deg)`;
      }
    } else {
      if (mode == 'letter') {
        letters = ['u', 'a', 'c', 'o', 'k', 'g', 's', 'e', 'l', 'x', 't', 'b', 'n', 'v', 'z', 'r', 'f', 'p', 'd', 'h']

        foundGoodLetter = false
        while (!foundGoodLetter) {
          possible = letters[getRand(0, letters.length-1)]

          if (!usedLetters.includes(possible)) {
            l = possible
            foundGoodLetter = true
            usedLetters[usedLetters.length] = l
          }
        }
      }

        i.src = `photos/normal/${l}i60.bmp`
    }
    i.style.display = 'inline'
  }

  return true
}

function line(r, size, random = false) {
  if (r==1) {document.getElementById('size').innerHTML = size}

  if (!(!multiLine && r != 1)) {
    if (mode != 'e') {ltrs = lettersInLine(size)}
    if (mode == 'e') {ltrs = lettersInELine(size)}
    spacing = spacingInLine(size)
    if (sgl) {ltrs = ltrs[0]}
    drawLine(r, 'normal', ltrs, spacing, random)
    if (size != "calibration") {
      setRowSize(r, (sizeOf20() * (size/20)))
    } else {
      setRowSize(r, (sizeOf20() * (124/20)))
    }
  }
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

function fill(size, random, buttonPress = false) {
  clearAll();
  
  if (cSize == size && buttonPress) {
    random = true
  }
  cSize = size

  if (size == '1') {
    line(1, 10, random)
  }
  if (size == '2') {
    line(1, 15, random)
    line(2, 10, random)
  }
  if (size == '3') {
    line(1, 20, random)
    line(2, 15, random)
    line(3, 10, random)
  }
  if (size == '4') {
    line(1, 25, random)
    line(2, 20, random)
    line(3, 15, random)
    line(4, 10, random)
  }
  if (size == '5') {
    line(1, 30, random)
    line(2, 25, random)
    line(3, 20, random)
    line(4, 15, random)
  }
  if (size == '6') {
    line(1, 40, random)
    line(2, 30, random)
    line(3, 25, random)
    line(4, 20, random)
  }
  if (size == '7') {
    line(1, 50, random)
    line(2, 40, random)
    line(3, 30, random)
  }
  if (size == '8') {
    line(1, 60, random)
    line(2, 50, random)
    line(3, 40, random)
  }
  if (size == '9') {
    line(1, 70, random)
    line(2, 60, random)
  }
  if (size == '10') {
    line(1, 80, random)
    line(2, 70, random)
  }
  if (size == '11') {
    line(1, 100, random)
    line(2, 80, random)
  }
  if (size == '12') {
    line(1, 125, random)
  }
  if (size == '13') {
    line(1, 150, random)
  }
  if (size == '14') {
    line(1, 200, random)
  }
  if (size == '15') {
    line(1, 250, random)
  }
  if (size == '16') {
    line(1, 300, random)
  }
  if (size == '17') {
    line(1, 400, random)
  }
  if (size == '18') {
    line(1, 500, random)
  }
  if (size == '19') {
    line(1, 630, random)
  }
  if (size == '20') {
    line(1, 800, random)
  }
  if (size == 'calibration'){
    line(1, 'calibration', false)
  }

  return true
}

function up() {
  if (cSize == "calibration") {cSize = 3}

  if (cSize != 20) {
    fill(cSize+1)
  }
}

function down() {
  if (cSize == "calibration") {cSize = 3}

  if (cSize != 1) {
    fill(cSize-1)
  }
}

function screenSaver() {
  clearAll();
  document.getElementById('size').innerHTML = ''
  
  x=document.getElementById('r1c1')
  x.style.display = 'inline'
  x.src = 'photos/screensaver.png'
  x.height = '275'
  x.width = '714'
}
