from strutils import AllChars, Letters, Digits
from strutils import split, toUpperAscii, join
from sequtils import filter, map
import sugar

proc abbreviate*(phrase: string): string =
  const nonWordChars = AllChars - Letters - {'\''} - Digits
  phrase.split(nonWordChars).filter(s => s.len > 0).map(s => $s[0].toUpperAscii).join()
