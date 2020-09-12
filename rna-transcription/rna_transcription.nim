import tables

const
  nucleotideTransTbl = {
      'G': 'C',
      'C': 'G',
      'T': 'A',
      'A': 'U',
    }.toTable

proc toRna*(dna: string): string =
  var rna = ""
  for n in dna:
    rna &= nucleotideTransTbl[n]
  rna
