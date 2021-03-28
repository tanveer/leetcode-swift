import Foundation

// 53. Maximum Subarray
// https://leetcode.com/problems/maximum-subarray

// MARK: - Solution
// ================
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard let first = nums.first else { return 0 }
        var currentSum = first
        var maxSum = currentSum

        for num in nums.dropFirst() {
            currentSum = max(num, currentSum + num)
            maxSum = max(maxSum, currentSum)
        }
        return maxSum
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
        XCTAssertEqual(s.maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]), 6)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.maxSubArray([1]), 1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.maxSubArray([0]), 0)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.maxSubArray([-1]), -1)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.maxSubArray([-2_147_483_647]), -2_147_483_647)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxSubArray([-3, -2, -1]), -1)
        XCTAssertEqual(s.maxSubArray([-1, -2, -3]), -1)
    }
}

Tests.defaultTestSuite.run()
