import strutils

proc encode*(str: string): string =
  var encStr = ""
  var buf = ""
  proc emptyBuf =
    if buf.len > 1:
      encStr &= $buf.len
    encStr &= buf[0]
    buf = ""    
  for i, c in str:
    if buf.len == 0:
      buf &= c
    elif buf[0] == c:
      buf &= c
    else:
      emptyBuf()
      buf &= c
    if i == str.len-1:
      emptyBuf()
  encStr

proc decode*(str: string): string =
  var decStr = ""
  type
    CurRepeat = object
      slice: array[2, int]
      value: int  # Numerical value of the repeat - late evaluation!
  var curRepeat: CurRepeat
  proc initCurRepeat =
    curRepeat = CurRepeat(slice: [-1, -1], value: -1)
  initCurRepeat()
  for i, c in str:
    if not isDigit(c):
      if curRepeat.slice[0] == -1:
        decStr &= c
      else:
        curRepeat.value = str[curRepeat.slice[0]..curRepeat.slice[1]].parseInt()
        decStr &= c.repeat(curRepeat.value)
        initCurRepeat()
    else:
      if curRepeat.slice[0] == -1:
        curRepeat.slice = [i, i]
      else:
        curRepeat.slice[1] = i
  decStr
