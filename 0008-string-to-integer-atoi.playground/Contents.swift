import Foundation

// 8. String to Integer (atoi)
// https://leetcode.com/problems/string-to-integer-atoi

// MARK: - Solution
// ================
class Solution {
    func myAtoi(_ s: String) -> Int {
        var i = 0
        var result = 0

        let chars = [Character](s)
        while i < chars.count && chars[i].isWhitespace {
            i += 1
        }

        guard i < s.count else { return result }

        var isPositive = true
        if chars[i] == "-" || chars[i] == "+" {
            if chars[i] == "-" {
                isPositive = false
            }
            i += 1
        }

        let set: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        while i < chars.count && set.contains(chars[i]) {
            let num = chars[i].wholeNumberValue ?? 0
            if result > Int32.max / 10 || (result == Int32.max / 10 && num > 7) {
                return isPositive ? Int(Int32.max) : Int(Int32.min)
            } else {
                result = (result * 10) + num
                i += 1
            }
        }

        if !isPositive {
            result.negate()
        }

        return result
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
        XCTAssertEqual(s.myAtoi("42"), 42)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.myAtoi("   -42"), -42)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.myAtoi("4193 with words"), 4193)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.myAtoi("words and 987"), 0)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.myAtoi("-91283472332"), -2147483648)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.myAtoi(""), 0)
    }
}

Tests.defaultTestSuite.run()
