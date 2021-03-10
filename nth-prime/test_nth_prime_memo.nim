import unittest
import times
import nth_prime

suite "Nth Prime with memoization":

  test "big prime":
    let start_time = cpuTime()
    check prime(11_111) == 117_763
    echo "Time taken for \"big prime\": ", cpuTime() - start_time

  test "big prime, second time":
    let start_time_memo = cpuTime()
    check prime(11_111) == 117_763
    echo "Time taken \"big prime, second time\": ", cpuTime() - start_time_memo
