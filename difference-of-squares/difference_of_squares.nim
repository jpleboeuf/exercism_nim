proc squareOfSum*(n: uint): uint =
  if n < 1:
    raise newException(ValueError, "n natural number")
  var sum: uint = 0
  for i in countup(uint(1), n):
      sum += i
  sum * sum

proc sumOfSquares*(n: uint): uint =
  if n < 1:
    raise newException(ValueError, "n natural number")
  var sum: uint = 0
  for i in countup(uint(1), n):
    sum += i * i
  sum

proc difference*(n: uint): uint =
  if n < 1:
    raise newException(ValueError, "n natural number")
  squareOfSum(n) - sumOfSquares(n)
