from strutils import toLowerAscii, isAlphaNumeric, splitWhitespace
from tables import CountTable, toCountTable

proc countWords*(str: string): CountTable[string] =
  var str_clean = ""
  for i, c in str:
    # The count is case insensitive:
    var c = toLowerAscii(c)
    # Let's handle the apostrophe case:
    if c == '\'':
      # An apostrophe at one of the bounds of the string
      #  is not in a contraction;
      #  therefore, treat it as a space:
      if i == 0 or i == str.len-1:
        c = ' '
      # An apostrophe in a contraction is okay;
      #  therefore, keep it:
      elif isAlphaNumeric(str[i-1]) and isAlphaNumeric(str[i+1]):
        c = '\''
      # In all other cases, treat the apostrophe as a space:
      else:
        c = ' '
    # Let's handle other non alphanumeric characters;
    #  treat them as space:
    elif not isAlphaNumeric(c):
      c = ' '
    # Character cleaning done,
    #  let's go on building the cleaned string:
    str_clean &= c
  # Create the hash table storing the word count:
  var words = str_clean.splitWhitespace()
  words.toCountTable()
