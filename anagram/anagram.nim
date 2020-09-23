from strutils import toLowerAscii
from algorithm import sorted
from sequtils import filter
import sugar

proc detectAnagrams*(word: string, candidates: seq[string]): seq[string] =
  result = @[]
  let wl = toLowerAscii(word)
  let wls = sorted(wl, system.cmp[char])
  result = candidates.filter(
      c => (
          let cl = toLowerAscii(c);
          sorted(cl, system.cmp[char]) == wls and cl != wl
        )
    )
