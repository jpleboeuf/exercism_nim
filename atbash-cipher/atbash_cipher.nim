import strutils
from std/wordwrap import wrapWords

const aOrd = ord('a')
const zOrd = ord('z')

proc transform(str: string): string =
  for c in str:
    if c.isAlphaAscii:
      result &= chr(zOrd - (ord(c.toLowerAscii) - aOrd))
    elif c.isDigit:
      result &= c
    else:
      continue

proc encode*(str: string): string =
  wrapWords(transform(str), maxLineWidth = 5, newLine = $' ')

proc decode*(str: string): string =
  transform(str)
