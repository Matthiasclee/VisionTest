function tglSingle() {
  if (sgl) {
    sgl = false
  } else {
    sgl = true
  }

  fill(cSize)
}

function tglLine() {
  if (multiLine) {
    multiLine = false
  } else {
    multiLine = true
  }
  fill(cSize)
}

function tglMode() {
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

function tglSizeNum() {
  e = document.getElementById('size')

  if (e.style.display == 'none') {
    e.style.display = 'inline'
  } else {
    e.style.display = 'none'
  }
}
