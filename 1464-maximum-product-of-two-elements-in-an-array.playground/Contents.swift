import Foundation

// 1464. Maximum Product of Two Elements in an Array
// https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array

// MARK: - Solution
// ================
class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var num1 = Int.min
        var num2 = Int.min

        for num in nums {
            if num >= num1 {
                (num2 , num1) = (num1, num)
            } else if num > num2 {
                num2 = num
            }
        }

        return (num1 - 1) * (num2 - 1)
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
        XCTAssertEqual(s.maxProduct([3, 4, 5, 2]), 12)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.maxProduct([1, 5, 4, 5]), 16)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.maxProduct([3, 7]), 12)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxProduct([]), 0)
    }
}

Tests.defaultTestSuite.run()
