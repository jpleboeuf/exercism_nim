import tables
import sugar
from sequtils import map
from strutils import join

const
  nucleotideTransTbl = {
      'G': 'C',
      'C': 'G',
      'T': 'A',
      'A': 'U',
    }.toTable

proc toRna*(dna: string): string =
  join(dna.map(n => nucleotideTransTbl[n]))
