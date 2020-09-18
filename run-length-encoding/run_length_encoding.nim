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
      slice: Slice[int]
      value: int  # Numerical value of the repeat - late evaluation!
  var curRepeat: CurRepeat
  proc initCurRepeat =
    curRepeat = CurRepeat(slice: (-1)..(-1), value: -1)
  initCurRepeat()
  for i, c in str:
    if not isDigit(c):
      if curRepeat.slice.a == -1:
        curRepeat.value = 1
      else:
        curRepeat.value = str[curRepeat.slice].parseInt()
      decStr &= c.repeat(curRepeat.value)
      initCurRepeat()
    else:
      if curRepeat.slice.a == -1:
        curRepeat.slice = i..i
      else:
        curRepeat.slice.b = i
  decStr
