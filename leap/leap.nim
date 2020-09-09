proc `%%`(a: int, b: int): bool {.inline.} =
  a mod b == 0
proc `!%`(a: int, b: int): bool {.inline.} =
  not (a %% b)

proc isLeapYear*(y: int): bool {.inline.} =
  (y %% 4) and ((y !% 100) or (y %% 400))
