template raiseValueError(err_msg: string): untyped =
  raise newException(ValueError, err_msg)

var
  primes {.global.}: seq[uint64] = @[2'u64, 3'u64]

proc is_prime(n: uint64): bool =
  ## returns whether n is a prime or not
  var furthest_nbr {.global.}: uint64 = primes[^1] + 1  # furthest number tested for primality
  if n <= furthest_nbr:
    if n in primes:
      return true
    else:
      return false
  for d in 2 .. n:
    if d * d > n:  # eq. 2 .. sqrt(n)
      break
    if n mod d == 0:
      furthest_nbr = n
      return false
  furthest_nbr = n + 1  # 2 and 3 and the only 2 consecutive primes
  return true

iterator primes_first(n: uint64): uint64 =
  ## yields the first n primes
  var i: uint64 = 0
  if n <= len(primes).uint64:
    while i < n:
      yield primes[i]
      inc i
  var nbr: uint64 = primes[^1]  # number currently tested for primality
  while len(primes).uint64 < n:
    inc(nbr, 2)  # 2 and 3 and the only 2 consecutive primes
    if is_prime(nbr):
      primes.add(nbr)
      yield primes[^1]

const IS_NOT_A_NTH: string = " is not a strictly positive natural number (i.e. positive excluding 0)"

proc prime*(n: uint64): uint64 =
  ## returns the n-th prime
  if n == 0:
    raiseValueError($n & IS_NOT_A_NTH)
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

  try:
    discard prime(0)
  except:
    assert getCurrentException() of ValueError and
      getCurrentExceptionMsg() == "0" & IS_NOT_A_NTH
  assert prime(1) == 2  # the 1st prime is 2
  assert prime(2) == 3  # the 2nd prime is 3
