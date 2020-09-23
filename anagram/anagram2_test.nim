import unittest
import anagram2

suite "Anagram 2":

  test "does not detect new anagrams which differ from previous ones only by their case":
    const word = "undefinability"
    const candidates = @["unidentifiably", "Unidentifiably"]
    check detectAnagrams2(word, candidates) == @["unidentifiably"]
