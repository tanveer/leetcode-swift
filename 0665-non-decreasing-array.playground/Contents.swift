import Foundation

// 665. Non-decreasing Array
// https://leetcode.com/problems/non-decreasing-array

// MARK: - Solution
// ================
class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else { return true }

        var nums = nums
        var isModified = false

        for i in 0..<nums.count - 1 where nums[i] > nums[i + 1] {
            if isModified {
                return false
            }

            if i > 0 && nums[i - 1] > nums[i + 1] {
                nums[i + 1] = nums[i]
            }

            isModified = true
        }

        return isModified
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.checkPossibility([4, 2, 3]))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.checkPossibility([4, 2, 1]))
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertFalse(s.checkPossibility([3, 4, 2, 3]))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.checkPossibility([]))
    }
}

Tests.defaultTestSuite.run()
