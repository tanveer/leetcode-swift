import Foundation

// 69. Sqrt(x)
// https://leetcode.com/problems/sqrtx

// MARK: - Solution
// ================
class Solution {
    func mySqrt(_ x: Int) -> Int {
        var left = 1
        var right = x

        while left < right {
            let mid = left + (right - left) / 2 // substract left from right before division to prevent overflow

            if mid * mid == x {
                return mid
            } else if mid * mid > x {
                right = mid // elemenate the right half
            } else if mid * mid < x {
                left = mid + 1 // elemenate the left half
            }
        }
        return left - 1
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
        XCTAssertEqual(s.mySqrt(4), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.mySqrt(8), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.mySqrt(0), 0)
    }
}

Tests.defaultTestSuite.run()
