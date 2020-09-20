proc onSquare*(sqIdx: int): uint =
  if sqIdx <= 0 or sqIdx > 64:
    raise newException(ValueError, "square index has to be between 1 and 64")
  const initAmount: uint = 1
  var amount: uint = initAmount
  var prevAmount: uint = amount
  for _ in countup(2, sqIdx):
    amount = 2 * prevAmount
    prevAmount = amount
  amount

proc total*(): uint =
  var tot: uint = 0
  for sqIdx in countup(1, 64):
    tot += onSquare(sqIdx)
  tot
