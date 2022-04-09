function getRand(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
}
function bodyFullScreen() {
  document.getElementsByTagName('html')[0].requestFullscreen()
}
function setRowImgs(r, size, type, allowRepeatingLetters) {
  images = []
  letters_normal = ['C', 'D', 'H', 'K', 'N', 'O', 'R', 'S', 'V', 'Z']
  letters_mirrored = ['C', 'D', 'H', 'K', 'N', 'O', 'R', 'S']

  for (let i = 0; i < 5; i++) {
    e = document.getElementById(`r${r}c${i+1}`)
    images[i] = e
  }

  usedLetters = []

  for (let n = 0; n < images.length; n++) {
    i = images[n]
    if (type == 'normal') {
      letters = letters_normal
    } else {
      letters = letters_mirrored
    }

    foundGoodLetter = false
    do {
      letterToTry = letters[getRand(0, letters.length-1)]
      if (!usedLetters.includes(letterToTry)) {
        l=letterToTry
        foundGoodLetter = true

        if (!allowRepeatingLetters) {
          usedLetters[usedLetters.length] = l
        }
      }
    }
    while (!foundGoodLetter) 

    s = size
    if (s.length < 5) {
      s = "0".repeat(5 - s.length) + s
    }

    i.src = `photos/${type}/C${l}${s}.bmp`
  }

  return true
}

function fill(size, type, allowRepeatingLetters) {
  x=1
  
  while (x < 6) {
    setRowImgs(x, size, type, allowRepeatingLetters)

    x++
  }

  document.getElementById('size').innerHTML=size

  return true
}
