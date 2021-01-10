import Foundation

// 374. Guess Number Higher or Lower
// https://leetcode.com/problems/guess-number-higher-or-lower

// MARK: - Solution
// ================
/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return       -1 if the picked number is lower than your guess number
 *                1 if the picked number is higher than your guess number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */
class GuessGame {
    var pick = Int.min

    func guess(_ num: Int) -> Int {
        if num < pick {
            return 1
        } else if num > pick {
            return -1
        } else {
            return 0
        }
    }
}

class Solution: GuessGame {
    func guessNumber(_ n: Int) -> Int {
        var low = 1
        var high = n

        while low <= high {
            let mid = low + (high - low) / 2
            let ans = guess(mid)
            if ans == 0 {
                return mid
            } else if ans < 0 {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return -1
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(log n)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        s.pick = 6
        XCTAssertEqual(s.guessNumber(10), 6)
    }

    func testLeetCodeExample2() {
        s.pick = 1
        XCTAssertEqual(s.guessNumber(1), 1)
    }

    func testLeetCodeExample3() {
        s.pick = 1
        XCTAssertEqual(s.guessNumber(2), 1)
    }

    func testLeetCodeExample4() {
        s.pick = 2
        XCTAssertEqual(s.guessNumber(2), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        s.pick = 500
        XCTAssertEqual(s.guessNumber(Int.max), 500)
    }
}

Tests.defaultTestSuite.run()
