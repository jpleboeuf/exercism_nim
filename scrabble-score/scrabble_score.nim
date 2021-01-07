import sequtils, tables, sugar
from strutils import toUpperAscii
from math import sum

const lv = block:
  const letterValues = @[
      (@"AEIOU" &
       @"LNRST",   1),
      (@"DG",      2),
      (@"BCMP",    3),
      (@"FHVWY",   4),
      (@"K",       5),
      (@"JX",      8),
      (@"QZ",     10),
    ]
  collect(initTable(26)):
    for i, lv in letterValues:
      for l in lv[0]:
        {l: lv[1].uint}

func score*(str: string): uint =
  sum str.toUpperAscii().mapIt(lv[it])
