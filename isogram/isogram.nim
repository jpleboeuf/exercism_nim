from strutils import toLowerAscii, isAlphaAscii

proc alphaPos(c: char): int {.inline.} =
  ord(c) - ord('a') + 1

proc isIsogram*(s: string): bool {.inline.} =
  var alphagram: array[1..26, int]
  for c in s:
    if isAlphaAscii(c):
      var l = toLowerAscii(c)
      inc(alphagram[alphaPos(l)])
      if alphagram[alphaPos(l)] > 1:
        return false
  return true
