from math import `^`, sum
from sequtils import toSeq, mapIt

template raiseValueError(): untyped =
  raise newException(ValueError, "n has to be a natural number")

func squareOfSum*(n: uint): uint =
  if n < 1: raiseValueError
  (sum toSeq(uint(1)..n)) ^ uint(2)

func sumOfSquares*(n: uint): uint =
  if n < 1: raiseValueError
  sum toSeq(uint(1)..n).mapIt(it ^ uint(2))

func difference*(n: uint): uint =
  if n < 1: raiseValueError
  squareOfSum(n) - sumOfSquares(n)
