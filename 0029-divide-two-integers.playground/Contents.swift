import Foundation

// 29. Divide Two Integers
// https://leetcode.com/problems/divide-two-integers

// MARK: - Solution
// ================
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        let isNegative = dividend > 0 && divisor < 0 || dividend < 0 && divisor > 0
        var dividend = abs(dividend)
        let divisor = abs(divisor)
        if dividend < divisor {
            return 0
        }

        var ans = 0
        while dividend >= divisor {
            var temp = divisor
            var qutient = 1
            while (temp << 1) < dividend {
                temp <<= 1
                qutient <<= 1
            }
            ans += qutient
            dividend -= temp
        }

        ans = isNegative ? -ans : ans

        if ans > Int32.max {
            return Int(Int32.max)
        }

        if ans < Int32.min {
            return Int(Int32.min)
        }

        return ans
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(1) 
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.divide(10, 3), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.divide(7, -3), -2)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.divide(0, 1), 0)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.divide(1, 1), 1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.divide(1000, 3), 333)
    }
}

Tests.defaultTestSuite.run()
