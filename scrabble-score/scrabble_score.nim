import sequtils, tables, sugar
from strutils import toUpperAscii
from math import sum

const lv = block:
  type
    LetterValue = object
      letter: char
      value: uint
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
  let lvLst = letterValues.map(
      lvd => (
          lvd[0].mapIt(LetterValue(letter: it, value: lvd[1].uint))
        )
    ).concat()
  collect(initTable(lvLst.len)):
    for i, lv in lvLst: {lv.letter: lv.value}

func score*(str: string): uint =
  sum str.toUpperAscii().mapIt(lv[it])
