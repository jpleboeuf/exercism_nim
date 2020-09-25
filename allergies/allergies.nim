from sequtils import mapit

type
  Allergies* = object
    score*: int
  Allergen = enum
    eggs         # (  1)
    peanuts      # (  2)
    shellfish    # (  4)
    strawberries # (  8)
    tomatoes     # ( 16)
    chocolate    # ( 32)
    pollen       # ( 64)
    cats         # (128)
  Allergens = set[Allergen]
proc toAllergens(v: int): Allergens = cast[Allergens](v)
proc toNum(a: Allergens): int = cast[int](a)
proc toAllergenLst(a: Allergens): seq[string] = a.mapIt($it)

proc lst*(allergies: Allergies): seq[string] {.inline.} =
  toAllergenLst(toAllergens(allergies.score))

proc isAllergicTo*(allergies: Allergies, allergen: string): bool {.inline.} =
  allergen in allergies.lst
