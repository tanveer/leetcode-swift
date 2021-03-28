import Foundation

// 263. Ugly Number
// https://leetcode.com/problems/ugly-number

// MARK: - Solution
// ================
class Solution {
    func isUgly(_ num: Int) -> Bool {
        guard num != 0 else { return false }
        var original = num

        for n in [2, 3, 5] {
            while original % n == 0 {
                original /= n
            }
        }
        return original == 1
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(1)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.isUgly(6))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.isUgly(8))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s.isUgly(14))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.isUgly(0))
    }
}

Tests.defaultTestSuite.run()
