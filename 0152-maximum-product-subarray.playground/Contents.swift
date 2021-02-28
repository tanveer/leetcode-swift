import Foundation

// 152. Maximum Product Subarray
// https://leetcode.com/problems/maximum-product-subarray

// MARK: - Solution
// ================
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard let first = nums.first else { return 0 }
        var currentMin = first
        var currentMax = first
        var overallMax = first

        for num in nums.dropFirst() {
            let minProduct = currentMin * num
            let maxProduct = currentMax * num
            currentMin = min(num, minProduct, maxProduct)
            currentMax = max(num, minProduct, maxProduct)
            overallMax = max(overallMax, currentMax)
        }

        return overallMax
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
        XCTAssertEqual(s.maxProduct([2, 3, -2, 4]), 6)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.maxProduct([-2, 0, -1]), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxProduct([]), 0)
    }
}

Tests.defaultTestSuite.run()
