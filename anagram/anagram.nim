from strutils import toLowerAscii
from algorithm import sorted

proc detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
  result = @[]
  let wl = toLowerAscii(word)
  let wls = sorted(wl, system.cmp[char])
  for c in candidates:
    let cl = toLowerAscii(c)
    if sorted(cl, system.cmp[char]) == wls and cl != wl:
      result.add(c)
