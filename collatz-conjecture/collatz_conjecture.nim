template raiseValueError(): untyped =
  raise newException(ValueError, "n has to be a strictly positive natural number (i.e. positive excluding 0)")

proc steps*(n: int): int =
  if n <= 0: raiseValueError
  var nn: int = n
  var stps: int = 0
  while true:
    if nn == 1:
      return stps
    else:
      inc stps
      if nn mod 2 == 0: nn = nn div 2 else: nn = nn * 3 + 1
