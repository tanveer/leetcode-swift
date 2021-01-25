import Foundation

// 747. Largest Number At Least Twice of Others
// https://leetcode.com/problems/largest-number-at-least-twice-of-others

// MARK: - Solution
// ================
class Solution {
    func dominantIndex(_ nums: [Int]) -> Int {
        var maxIndex = 0

        for i in nums.indices where nums[i] > nums[maxIndex] {
            maxIndex = i
        }

        for i in nums.indices where maxIndex != i && nums[maxIndex] < 2 * nums[i] {
            return -1
        }

        return maxIndex
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
        XCTAssertEqual(s.dominantIndex([3, 6, 1, 0]), 1)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.dominantIndex([1, 2, 3, 4]), -1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.dominantIndex([]), 0)
    }
}

Tests.defaultTestSuite.run()
