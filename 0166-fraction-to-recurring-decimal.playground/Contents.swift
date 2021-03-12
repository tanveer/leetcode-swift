import Foundation

// 166. Fraction to Recurring Decimal
// https://leetcode.com/problems/fraction-to-recurring-decimal

// MARK: - Solution
// ================
class Solution {
    func fractionToDecimal(_ numerator: Int, _ denominator: Int) -> String {
        guard numerator != 0 else { return "0" }

        var result = [String]()

        if (numerator < 0 && denominator > 0) || numerator > 0 && denominator < 0 {
            result.append("-")
        }

        let dividend = abs(numerator)
        let divisor = abs(denominator)
        result.append("\(dividend / divisor)")
        var remainder = dividend % divisor

        if remainder == 0 {
            return result.joined()
        }

        result.append(".")
        var map = [Int: Int]()
        while remainder != 0 {
            if let value = map[remainder] {
                result.insert("(", at: value)
                result.append(")")
                break
            }

            map[remainder] = result.count
            remainder *= 10
            result.append("\(remainder / divisor)")
            remainder %= divisor
        }

        return result.joined()
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
    func testLeetCodeExample1() {
        XCTAssertEqual(s.fractionToDecimal(1, 2), "0.5")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.fractionToDecimal(2, 1), "2")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.fractionToDecimal(2, 3), "0.(6)")
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.fractionToDecimal(4, 333), "0.(012)")
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.fractionToDecimal(1, 5), "0.2")
    }

    func testLeetCodeExample6() {
        XCTAssertEqual(s.fractionToDecimal(-50, 8), "-6.25")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.fractionToDecimal(0, 0), "0")
    }
}

Tests.defaultTestSuite.run()
