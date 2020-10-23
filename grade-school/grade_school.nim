type
  Student* = tuple[name: string, grade: int]
  School* = object
    students*: seq[Student]
