from sequtils import filter, map
import sugar
from strutils import AllChars, Letters, Digits
from strutils import toLowerAscii, split, strip
from tables import CountTable, toCountTable

proc countWords*(str: string): CountTable[string] =
  const nonWordChars = AllChars - Letters - Digits - {'\''}
  var words = toLowerAscii(str).split(nonWordChars).filter(s => s.len > 0).map(w => w.strip(chars = {'\''}))
  words.toCountTable()
