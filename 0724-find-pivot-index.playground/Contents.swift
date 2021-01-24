import Foundation

// 724. Find Pivot Index
// https://leetcode.com/problems/find-pivot-index

// MARK: - Solution
// ================
class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let sum = nums.reduce(0, +)
        var leftSum = 0
        for index in 0..<nums.count {
            let rightSum = (sum - leftSum - nums[index])
            if leftSum == rightSum {
                return index
            }
            leftSum += nums[index]
        }

        return -1
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
        XCTAssertEqual(s.pivotIndex([1, 7, 3, 6, 5, 6]), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.pivotIndex([1, 2, 3]), -1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.pivotIndex([]), -1)
    }
}

Tests.defaultTestSuite.run()
