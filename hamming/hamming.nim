import sugar
from sequtils import zip, filter

proc distance*(dna1: string, dna2: string): int =
  if dna1.len != dna2.len:
    raise newException(ValueError, "sequences not of equal length")
  zip(@dna1, @dna2).filter(n => n[0] != n[1]).len
