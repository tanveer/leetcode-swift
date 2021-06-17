import Foundation

// 367. Valid Perfect Square
// https://leetcode.com/problems/valid-perfect-square

// MARK: - Solution
// ================
class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        var n = 1

        while n * n <= num {
            if num % n == 0, num / n == n {
                return true
            }
            n += 1
        }
        return false
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
        XCTAssertTrue(s.isPerfectSquare(16))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.isPerfectSquare(14))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.isPerfectSquare(9))
    }
}

Tests.defaultTestSuite.run()
