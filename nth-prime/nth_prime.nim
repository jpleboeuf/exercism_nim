import macros
import tables

template raiseValueError(err_msg: string): untyped =
  raise newException(ValueError, err_msg)

macro `:=`(name: untyped, value: untyped): untyped = 
  quote do:
    `name` = `value`; `name`

proc is_prime(n: uint64): bool =
  ## returns whether n is a prime or not
  var nbr_primality {.global.} = initOrderedTable[uint64, bool]()
  if n in nbr_primality:
    return nbr_primality[n]
  if n == 0 or n == 1:
    return nbr_primality[n] := false
  for d in 2 .. n:
    if d * d > n:  # eq. 2 .. sqrt(n)
      break
    if n mod d == 0:
      return nbr_primality[n] := false
  return nbr_primality[n] := true

iterator primes_first(n: uint): uint =
  ## yields the first n primes
  var primes:seq[uint] = @[2'u, 3'u]
  if n >= 1:
    yield primes[0]
  if n >= 2:
    yield primes[1]
  var nbr: uint = primes[1]  # number currently tested for primality
  while len(primes).uint < n:
    inc(nbr, 2)  # 2 and 3 and the only 2 consecutive primes
    if is_prime(nbr):
      primes.add(nbr)
      yield primes[^1]

proc prime*(n: uint): uint =
  ## returns the n-th prime
  if n == 0:
    raiseValueError("n has to be a strictly positive natural number (i.e. positive excluding 0)")
  for p in primes_first(n):
    result = p


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
