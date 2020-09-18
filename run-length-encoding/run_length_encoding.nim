import strutils, parseutils

proc encode*(str: string): string =
  var encStr = ""
  var skip = 0
  for i, c in str:
    if i < skip:
      continue     # Nah, I don't want to use a ``while`` :)
    let count = str.skipWhile({c}, start = i)
    if count > 1:
      encStr &= $count
    encStr &= $c
    skip += count  # It would be awesome to have the iterator ``skip(count)``.
  encStr

proc decode*(str: string): string =
  var decStr = ""
  var count = -1
  for (token, isNum) in str.tokenize(Digits):
    if isNum:
      count = token.parseInt()
    else:
      if count == -1:
        decStr &= token
      else:
        # When the previous token is a number,
        #  ``token[0]`` contains the first char after the number
        decStr &= token[0].repeat(count)
        #  and ``token[1..^1]`` contains the other chars.
        decStr &= token[1..^1]
        count = -1
  decStr
