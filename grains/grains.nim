from math import `^`, sum
from sequtils import toSeq, mapIt

func onSquare*(sqIdx: int): uint =
  if sqIdx <= 0 or sqIdx > 64:
    raise newException(ValueError, "square index has to be between 1 and 64")
  result = uint(2) ^ uint(sqIdx - 1)

func total*(): uint =
  sum toSeq(1..64).mapIt(onSquare(it))
