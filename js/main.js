function getRand(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
}
function setRowImgs(r, size, type, allowRepeatingLetters) {
  images = []
  letters = ['C', 'D', 'H', 'K', 'N', 'O', 'R', 'S', 'V', 'Z']

  for (let i = 0; i < 5; i++) {
    e = document.getElementById(`r${r}c${i+1}`)
    images[i] = e
  }

  usedLetters = []

  for (let n = 0; n < images.length; n++) {
    i = images[n]

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
