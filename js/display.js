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
    mode = 'hotv'
    fill(cSize)
    return
  }
  if (mode == 'hotv') {
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

function tglModeRev() {
  if (mode == 'letter') {
    mode = 'e'
    fill(cSize)
    return
  }
  if (mode == 'e') {
    mode = 'symbol'
    fill(cSize)
    return
  }
  if (mode == 'symbol') {
    mode = 'number'
    fill(cSize)
    return
  }
  if (mode == 'number') {
    mode = 'hotv'
    fill(cSize)
    return
  }
  if (mode == 'hotv') {
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
