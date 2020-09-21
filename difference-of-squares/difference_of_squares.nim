template raiseValueError(): untyped =
  raise newException(ValueError, "n has to be a natural number")

proc squareOfSum*(n: uint): uint =
  if n < 1: raiseValueError
  var sum: uint = 0
  for i in countup(uint(1), n):
      sum += i
  sum * sum

proc sumOfSquares*(n: uint): uint =
  if n < 1: raiseValueError
  var sum: uint = 0
  for i in countup(uint(1), n):
    sum += i * i
  sum

proc difference*(n: uint): uint =
  if n < 1: raiseValueError
  squareOfSum(n) - sumOfSquares(n)
