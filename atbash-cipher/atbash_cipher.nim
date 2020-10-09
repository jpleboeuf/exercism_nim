import strutils
from std/wordwrap import wrapWords

const aOrd = ord('a')
const zOrd = ord('z')

proc encode*(str: string): string =
  var encStr = ""
  for c in str:
    if c.isAlphaAscii:
      encStr &= chr(zOrd - (ord(c.toLowerAscii) - aOrd))
    elif c.isDigit:
      encStr &= c
    else:
      continue    
  wrapWords(encStr.strip, maxLineWidth = 5, newLine = $' ')

proc decode*(str: string): string =
  var decStr = ""
  for c in str:
    if c.isAlphaAscii:
      decStr &= chr(aOrd + (zOrd - ord(c.toLowerAscii)))
    elif c.isDigit():
      decStr &= c
    else:
      continue
  decStr
