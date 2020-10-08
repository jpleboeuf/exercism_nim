import strutils

const aOrd = ord('a')
const zOrd = ord('z')

proc encode*(str: string): string =
  var encStr = ""
  var gl = 0
  for c in str:
    if c.isAlphaAscii:
      encStr &= chr(zOrd - (ord(c.toLowerAscii) - aOrd))
    elif c.isDigit:
      encStr &= c
    else:
      continue
    inc(gl)
    if gl mod 5 == 0:
      encStr &= ' '
      gl = 0
  encStr.strip
    
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
