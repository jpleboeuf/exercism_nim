from algorithm import sortedByIt
from sequtils import unzip, filterIt

type
  Student* = tuple
    name: string
    grade: int
  School* = object
    students*: seq[Student]

proc roster*(scool: School): seq[string] =
  scool.students.sortedByIt((it.grade, it.name)).unzip[0]

proc grade*(scool: School, graad: int): seq[string] =
  # Does not work
  #  (see https://github.com/nim-lang/Nim/issues/12928#issuecomment-716251308):
  #scool.students.filterIt(it.grade == graad).sortedByIt(it.name).unzip[0]
  # Until a fix, the following works:
  let stuudents = scool.students.filterIt(it.grade == graad)
  stuudents.sortedByIt(it.name).unzip[0]
  # BTW, the following works too, though less meaningful:
  #scool.students.sortedByIt(it.name).filterIt(it.grade == graad).unzip[0]
