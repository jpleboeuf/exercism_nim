import macros
import tables

template raiseValueError(err_msg: string): untyped =
  raise newException(ValueError, err_msg)

macro `:=`(name: untyped, value: untyped): untyped = 
  quote do:
    `name` = `value`; `name`

proc is_prime(n: uint64): bool =
  ## returns whether n is a prime or not
  var primes {.global.} = initOrderedTable[uint64, bool]()
  if n in primes:
    return primes[n]
  if n == 0 or n == 1:
    return primes[n] := false
  for d in 2 .. n:
    if d * d > n:  # eq. 2 .. sqrt(n)
      break
    if n mod d == 0:
      return primes[n] := false
  return primes[n] := true

proc prime*(n: uint): uint =
  ## returns the n-th prime
  if n == 0:
    raiseValueError("n has to be a strictly positive natural number (i.e. positive excluding 0)")
  if n == 1:
    return 2
  elif n == 2:
    return 3
  var nbr: uint = 3    # number currently tested for primality
  var i: uint = 2      # loop index (for the i-th prime)
  result = nbr  # i-th prime
  while i < n:
    inc(nbr, 2)  # 2 and 3 and the only 2 consecutive primes
    if is_prime(nbr):
      inc i
      result = nbr


when isMainModule:

  assert not is_prime(0)  # the zero is not a prime
  assert not is_prime(1)  # the unit is not a prime
  assert is_prime(2)
  assert is_prime(3)
  assert is_prime(5)
  assert is_prime(7)
  assert is_prime(11)
  assert is_prime(13)

  assert prime(1) == 2  # the 1st prime is 2
  assert prime(2) == 3  # the 2nd prime is 3
