proc isLeapYear*(y: int): bool {.inline.} =
  (y mod 4 == 0) and (y mod 100 != 0 or y mod 400 == 0)
