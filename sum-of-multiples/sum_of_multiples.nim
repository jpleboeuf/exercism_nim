from math import sum
from sequtils import toSeq, filterIt, any

template raiseValueError(): untyped =
  raise newException(ValueError, "n has to be a natural number (0 tolerated)")

template `%%`(a: int, b: int): bool =
  a mod b == 0

proc sum*(n: int, mltpls: seq[int]): int =
  if n < 0: raiseValueError
  for m in mltpls:
    if m < 0: raiseValueError
  math.sum toSeq(1..n).filterIt(
      any(mltpls, proc(m: int): bool =
          try:
            result = it %% m
          except DivByZeroError:
            # not printed when it == n (short-circuit evaluation?):
            echo "(factor 0 encountered)"  
          return result and it != n
        ) == true
    )
