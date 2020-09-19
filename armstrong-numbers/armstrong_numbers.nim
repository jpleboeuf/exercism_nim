from math import `^`, sum
from sequtils import mapIt

proc isArmstrongNumber*(nbr: int): bool {.inline.} =
  let nbrStr: string = $nbr
  let nbrDigits: int = len(nbrStr)
  sum(nbrStr.mapIt((ord(it) - ord('0')) ^ nbrDigits)) == nbr
