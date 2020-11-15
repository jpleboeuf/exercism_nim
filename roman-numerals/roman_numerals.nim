import strutils
import tables
from math import `^`

const r = {
    1:    "I", 5:    "V",
    10:   "X", 50:   "L",
    100:  "C", 500:  "D",
    1000: "M", 5000: "V̅",
  }.toTable

proc roman*(n: int): string =
  let n_len = len($n)
  for i, nc in $n:
    var nd = parseInt($nc)             # n'digit
    var nd_val = 10 ^ (n_len - (i+1))  # n'digit's value in base 10
    try:
      result &= (
        case nd:
          of 0:
            ""  # skip
          of 1..3:
            r[nd_val].repeat(nd)
          of 4:
            r[nd_val] & r[nd_val*5]
          of 5:
            r[nd_val*5]
          of 6..8:
            r[nd_val*5] & r[nd_val].repeat(nd-5)
          of 9:
            r[nd_val] & r[nd_val*10]
          else:
            raise newException(ValueError, $nd & ": not a base 10 digit.")
        )
    except KeyError:
      let e_msg = getCurrentExceptionMsg()
      let e_msg_prfx = "key not found:"
      let r_key = e_msg[e_msg.find(e_msg_prfx)+len(e_msg_prfx)+1..^1]
      echo "Unknown representation for " & r_key & "."
      result &= "?"

when isMainModule:
  echo roman(2001)
