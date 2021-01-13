import Foundation

// 441. Arranging Coins
// https://leetcode.com/problems/arranging-coins

// MARK: - Solution
// ================
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        var left = 0
        var right = n

        while left <= right {
            let num = (right + left) / 2
            let current = num * ( num + 1 ) / 2
            if current == n {
                return num
            }

            if n < current {
                right = num - 1
            } else {
                left = num + 1
            }
        }

        return right
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.arrangeCoins(5), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.arrangeCoins(8), 3)
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.arrangeCoins(1), 1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.arrangeCoins(9), 3)
        XCTAssertEqual(s.arrangeCoins(10), 4)
        XCTAssertEqual(s.arrangeCoins(11), 4)
    }
}

Tests.defaultTestSuite.run()
