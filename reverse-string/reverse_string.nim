iterator reverse_iter[T](s: seq[T]): T {.inline.} =
  var i = len(s) - 1
  while i > -1:
    yield s[i]
    dec(i)

iterator `$^`(str: string): char {.inline.} =
  for c in reverse_iter(cast[seq[char]](str)):
    yield c

proc reverse*(str: string): string =
  var str_rev = ""
  for c in $^str:
    str_rev &= c
  str_rev
