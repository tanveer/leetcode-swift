import Foundation

// 628. Maximum Product of Three Numbers
// https://leetcode.com/problems/maximum-product-of-three-numbers

// MARK: - Solution
// ================
class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var min1 = Int.max
        var min2 = Int.max
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.max

        for n in nums {
            if n <= min1 {
                min2 = min1
                min1 = n
            } else if n <= min2 {
                min2 = n
            }

            if n >= max1 {
                max3 = max2
                max2 = max1
                max1 = n
            } else if n >= max2 {
                max3 = max2
                max2 = n
            } else if n >= max3 {
                max3 = n
            }
        }
        let product = max(min1 * min2 * max1, max1 * max2 * max3)

        return product
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
        XCTAssertEqual(s.maximumProduct([1, 2, 3]), 6)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.maximumProduct([1, 2, 3, 4]), 24)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maximumProduct([]), 0)
    }
}

Tests.defaultTestSuite.run()
