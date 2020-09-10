from strutils import toLowerAscii, isAlphaAscii

proc alphaPos(c: char): int {.inline.} =
  ord(c) - ord('a') + 1

proc isIsogram*(s: string): bool {.inline.} =
  var alphagram: array[1..26, int]
  for c in s:
    if isAlphaAscii(c):
      var l = toLowerAscii(c)
      var lap = alphaPos(l)
      inc(alphagram[lap])
      if alphagram[lap] > 1:
        return false
  return true
