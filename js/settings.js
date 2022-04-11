if (!localStorage.pxsize) {
  localStorage.pxsize = 10
}
if (!localStorage.mirrored) {
  localStorage.mirrored = 0
}

function sizeOf10() {
  document.getElementById('sizeOf10').innerHTML = localStorage.pxsize + 'px'
  return localStorage.pxsize
}

function lettersInLine(line) {
  lines = {
    10: ['O', 'R', 'Z', 'S', 'K', 'D'],
    15: ['O', 'H', 'P', 'N', 'T', 'Z'],
    20: ['T', 'Z', 'V', 'E', 'C', 'L'],
    25: ['A', 'P', 'E', 'O', 'T', 'F'],
    30: ['O', 'F', 'L', 'C', 'T'],
    40: ['F', 'Z', 'B', 'D', 'E'],
    50: ['E', 'G', 'N', 'D', 'H'],
    60: ['D', 'A', 'O', 'F'],
    70: ['V', 'L', 'N', 'E'],
    80: ['P', 'H', 'T'],
    100: ['H', 'B'],
    125: ['D', 'O'],
    150: ['A', 'V'],
    200: ['E', 'Z'],
    250: ['C'],
    300: ['F'],
    400: ['B'],
    500: ['K'],
    630: ['H'],
    800: ['C']
  }

  return lines[line]
}

function lettersInELine(line) {
  lines = {
    10: ['E', 'E', 'E', 'E'],
    15: ['E', 'E', 'E', 'E'],
    20: ['E', 'E', 'E', 'E'],
    25: ['E', 'E', 'E', 'E'],
    30: ['E', 'E', 'E', 'E'],
    40: ['E', 'E', 'E', 'E'],
    50: ['E', 'E', 'E', 'E'],
    60: ['E', 'E', 'E', 'E'],
    70: ['E', 'E', 'E', 'E'],
    80: ['E', 'E', 'E'],
    100: ['E', 'E'],
    125: ['E', 'E'],
    150: ['E', 'E'],
    200: ['E', 'E'],
    250: ['E'],
    300: ['E'],
    400: ['E'],
    500: ['E'],
    630: ['E'],
    800: ['E']
  }

  return lines[line]
}
