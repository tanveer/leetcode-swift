import Foundation

// 198. House Robber
// https://leetcode.com/problems/house-robber

// MARK: - Solution
// ================
class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var maxAmount1 = 0
        var maxAmount2 = 0

        for i in nums.indices {
            if i.isMultiple(of: 2) {
                maxAmount1 = max(maxAmount1 + nums[i], maxAmount2)
            } else {
                maxAmount2 = max(maxAmount2 + nums[i], maxAmount1)
            }
        }

        return max(maxAmount1, maxAmount2)
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
        XCTAssertEqual(s.rob([1, 2, 3, 1]), 4)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.rob([2, 7, 9, 3, 1]), 12)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.rob([]), 0)
    }
}

Tests.defaultTestSuite.run()
