import anagram
from strutils import toLowerAscii
from sequtils import mapIt, deduplicate

proc detectAnagrams2*(word: string, candidates: seq[string]): seq[string] =
  deduplicate(detectAnagrams(word, candidates.mapIt(it.toLowerAscii())))
