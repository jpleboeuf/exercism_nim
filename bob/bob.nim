# Enable experimental ``case`` statement macros:
import macros
{.experimental: "caseStmtMacros".}
#
import strutils
import tables

type
  MsgKind = enum
    mkA  # Asking
    mkY  # Yelling
    mkN  # Nothing
  MsgKinds = set[MsgKind]

proc msgKinds(msg: string): MsgKinds =
  var msgKinds: MsgKinds
  if msg.isEmptyOrWhitespace():
    incl(msgKinds, mkN)
  else:
    if msg.strip().endsWith('?'):
      incl(msgKinds, mkA)
    if Letters in msg and msg == msg.toUpperAscii():
      incl(msgKinds, mkY)
  msgKinds

macro match(n: set): untyped =
  # Macro allowing ``case`` statements to deal with ``set``s.
  # It does so by rewriting these ``case`` statements to ``if`` statements.
  # It only matches ``case`` statement's selectors of type ``set``.
  #
  # Produce a new ``if`` statement node:
  result = newTree(nnkIfStmt)
  # Name the ``case`` statement's selector:
  let nSelector = n[0]
  # Iterate over the ``case`` statement's branches:
  for i in 1..<n.len:
    # Name the current ``case`` statement's branch:
    let nBranch = n[i]
    # Switch depending on the kind of the ``case`` statement's part:
    case nBranch.kind:
      # ``if`` statement/expression branch:
      of nnkElifBranch, nnkElse, nnkElifExpr, nnkElseExpr:
        # Just copy these kinds of branch:
        result.add nBranch
      # ``of`` branch:
      of nnkOfBranch:
        # Iterate over the comma-separated list of ``set``s:
        for j in 0..nBranch.len-2:
          # Replace the ``of`` branch by an ``elif`` branch
          #  testing for equality between
          #  the ``set`` in the selector
          #  and the current ``set``
          #  (leveraging the existing equality operator for ``set``s):
          let cond = newCall("==", nSelector, nBranch[j])
          result.add newTree(nnkElifBranch, cond, nBranch[^1])
      else:
          error "'match' cannot handle this node", nBranch
  echo repr result

proc hey*(message: string): string =
  const replyTo = {
      "asking_question": "Sure.",
      "yelling": "Whoa, chill out!",
      "yelling_question": "Calm down, I know what I'm doing!",
      "saying_nothing": "Fine. Be that way!",
      "default": "Whatever.",
    }.toTable
  case msgKinds(message):
    of {mkA}:
      return replyTo["asking_question"]
    of {mkY}:
      return replyTo["yelling"]
    of {mkA} + {mkY}:
      return replyTo["yelling_question"]
    of {mkN}:
      return replyTo["saying_nothing"]
    else:
      return replyTo["default"]
