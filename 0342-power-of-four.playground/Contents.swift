import Foundation

// 342. Power of Four
// https://leetcode.com/problems/power-of-four

// MARK: - Solution
// ================
class Solution {
    func isPowerOfFour(_ n: Int) -> Bool {
        guard n > 0 else { return false }

        var num = 1
        while num < n {
            num *= 4
        }

        return num == n
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
        XCTAssertTrue(s.isPowerOfFour(16))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.isPowerOfFour(5))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.isPowerOfFour(0))
    }
}

Tests.defaultTestSuite.run()
