import strutils
import sequtils, algorithm, tables
from std/wordwrap import wrapWords

const transformMap = block:
  ## Generate the hash table used for encoding/decoding.
  let
    upperAlphaChars = toSeq('A'..'Z')
    lowerAlphaChars = toSeq('a'..'z')
    alphaChars = upperAlphaChars & lowerAlphaChars
    digitChars = toSeq('0'..'9')
    fromChars = alphaChars & digitChars
    #reverseUpperAlphaChars = reversed(upperAlphaChars)
    reverseLowerAlphaChars = reversed(lowerAlphaChars)
    reverseAlphaChars = reverseLowerAlphaChars & reverseLowerAlphaChars
    toChars = reverseAlphaChars & digitChars
  var transformMap = initTable[char, char]()
  for pair in zip(fromChars, toChars):
    let (fromChar, toChar) = pair
    transformMap[fromChar] = toChar
  transformMap

proc transform(str: string): string =
  for c in str:
    if c.isAlphaNumeric:
      result &= transformMap[c]

proc encode*(str: string): string =
  wrapWords(transform(str), maxLineWidth = 5, newLine = $' ')

proc decode*(str: string): string =
  transform(str)
