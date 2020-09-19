import strutils, math

proc isArmstrongNumber*(nbr: int): bool =
  let nbrStr: string = $nbr
  let nbrDigits: int = len(nbrStr)
  var sum: int = 0
  for d in nbrStr:
    sum += ($d).parseInt() ^ nbrDigits
  sum == nbr
