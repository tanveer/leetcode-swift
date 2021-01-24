import Foundation

// 55. Jump Game
// https://leetcode.com/problems/jump-game

// MARK: - Solution
// ================
class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard !nums.isEmpty else { return true }

        var position = nums.first ?? 0

        for (i, num) in nums.enumerated() {
            if position < i {
                return false
            }
            position = max(position, i + num)
        }

        return true
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
        XCTAssertTrue(s.canJump([2, 3, 1, 1, 4]))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.canJump([3, 2, 1, 0, 4]))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.canJump([]))
    }
}

Tests.defaultTestSuite.run()
