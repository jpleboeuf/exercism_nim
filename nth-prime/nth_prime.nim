import macros
import tables

template raiseValueError(): untyped =
  raise newException(ValueError, "n has to be a strictly positive natural number (i.e. positive excluding 0)")

macro `:=`(name: untyped, value: untyped): untyped = 
  quote do:
    `name` = `value`; `value`

proc is_prime(n: uint64): bool =
  ## returns whether n is a prime or not
  var primes {.global.} = initOrderedTable[uint64, bool]()
  if n in primes:
    return primes[n]
  for d in 2 .. n:
    if d * d > n:  # eq. 2 .. sqrt(n)
      break
    if n mod d == 0:
      return primes[n] := false
  return primes[n] := true

proc prime*(n: uint): uint =
  ## returns the n-th prime
  if n == 0: raiseValueError
  var nbr: uint = 2    # number currently tested for primality
  var i: uint = 1      # loop index (for the i-th prime)
  var p_i: uint = nbr  # i-th prime
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
