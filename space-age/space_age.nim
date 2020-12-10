import tables, sequtils, sugar

#[
  One Earth year in seconds.
]#
const eyis: float = 365.25 * 24 * 60 * 60

#[
  Orbital period in Earth seconds for misc. planets,
   calculated for each planet by multiplying
   the orbital period in Earth years of this planet
   per the duration of one Earth year in seconds.
]#
var opies: Table[string, float] = {
    "Mercury":   0.2408467,
    "Venus":     0.61519726,
    "Earth":     1.0,
    "Mars":      1.8808158,
    "Jupiter":  11.862615,
    "Saturn":   29.447498,
    "Uranus":   84.016846,
    "Neptune": 164.79132,
  }.map(x => (x[0], x[1] * eyis)).toTable
type UnknownPlanet* = object of KeyError

#[
  age returns,
   given the age of someone in seconds, and a planet,
   how old this someone would be in years on this planet.
]#
proc age*(planet: string, seconds: int64): float =
  if not opies.hasKey(planet):
     raise UnknownPlanet.newException(planet & " is not known to be part of the Solar System!")
  seconds.float / opies[planet]
