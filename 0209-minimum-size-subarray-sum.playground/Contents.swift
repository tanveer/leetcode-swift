import Foundation

// 209. Minimum Size Subarray Sum
// https://leetcode.com/problems/minimum-size-subarray-sum

// MARK: - Solution
// ================
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var count = Int.max
        var left = 0
        var sum = 0

        for (i, num) in nums.enumerated() {
            sum += num
            while sum >= s {
                count = min(count, i + 1 - left)
                sum -= nums[left]
                left += 1
            }
        }

        return count != Int.max ? count : 0
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(1y


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample() {
        XCTAssertEqual(s.minSubArrayLen(7, [2, 3, 1, 2, 4, 3]), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.minSubArrayLen(0, []), 0)
    }
}

Tests.defaultTestSuite.run()
