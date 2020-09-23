from strutils import toLowerAscii
from algorithm import sorted

proc detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
  result = @[]
  let wl = toLowerAscii(word)
  let wl_srtd = sorted(wl, system.cmp[char])
  for c in candidates:
    var cl = toLowerAscii(c)
    if sorted(cl, system.cmp[char]) == wl_srtd and cl != wl:
      result.add(c)
