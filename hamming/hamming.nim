from sequtils import zip

proc distance*(dna1: string, dna2: string): int =
  var d = 0
  if dna1.len != dna2.len:
    raise newException(ValueError, "sequences not of equal length")
  else:
    for (n1, n2) in zip(@dna1, @dna2).items:
      if n1 != n2: inc(d)
  d
