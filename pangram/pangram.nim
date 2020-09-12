from sequtils import foldl
from strutils import toLowerAscii, isAlphaAscii

proc `|=`(a: var bool, b: bool): bool {.discardable, inline.} =
  a = a or b

proc alphaPos(c: char): int {.inline.} =
  ord(c) - ord('a') + 1

proc isPangram*(s: string): bool {.inline.} =
  var alphacheck: array[1..26, bool]
  for c in s:
    if isAlphaAscii(c):
      var l = toLowerAscii(c)
      var lap = alphaPos(l)
      alphacheck[lap] |= true
  foldl(@alphacheck, a and b)
