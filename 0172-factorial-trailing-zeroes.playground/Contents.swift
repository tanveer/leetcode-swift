import Foundation

// 172. Factorial Trailing Zeroes
// https://leetcode.com/problems/factorial-trailing-zeroes

// MARK: - Solution
// ================
class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        guard n > 3 else { return 0 }
        var count = 0
        var devisor = 5

        while devisor <= n {
            count += n / devisor
            devisor *= 5
        }

        return count
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
        XCTAssertEqual(s.trailingZeroes(3), 0)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.trailingZeroes(5), 1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.trailingZeroes(0), 0)
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.trailingZeroes(30), 7)
        XCTAssertEqual(s.trailingZeroes(50), 12)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.trailingZeroes(0), 0)
    }
}

Tests.defaultTestSuite.run()
