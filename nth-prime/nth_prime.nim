template raiseValueError(): untyped =
  raise newException(ValueError, "n has to be a strictly positive natural number (i.e. positive excluding 0)")

func is_prime(n: uint64): bool =
  for d in 2 .. n-1:
    if n mod d == 0:
      return false
  return true

func prime*(n: uint): uint =
  if n == 0: raiseValueError
  var nbr: uint = 2
  var i: uint = 1
  var p_i: uint = nbr
  while i < n:
    inc nbr
    if is_prime(nbr):
      inc i
      p_i = nbr
  p_i

when isMainModule:
  assert is_prime(2)
  assert is_prime(3)
  assert is_prime(5)
  assert is_prime(7)
  assert is_prime(11)
  assert is_prime(13)
