import Foundation

// 238. Product of Array Except Self
// https://leetcode.com/problems/product-of-array-except-self

// MARK: - Solution
// ================
class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = [Int](repeating: 1, count: nums.count)
        var left = 1

        for i in 0..<nums.count {
            result[i] = left
            left = nums[i] * left
        }

        var right = 1
        for i in stride(from: nums.count - 1, to: -1, by: -1) {
            result[i] *= right
            right *= nums[i]
        }

        return result
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
    func testLeetCodeExample() {
        XCTAssertEqual(s.productExceptSelf([1, 2, 3, 4]), [
            24, // 2 x 3 x 4
            12, // 1 x 2 x 3
            8,  // 1 x 2 x 4
            6,  // 1 x 2 x 3
        ])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.productExceptSelf([1, 2]), [2, 1])
    }
}

Tests.defaultTestSuite.run()
