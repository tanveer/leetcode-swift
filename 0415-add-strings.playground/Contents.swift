import Foundation

// 415. Add Strings
// https://leetcode.com/problems/add-strings

// MARK: - Solution
// ================
class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {

        var newNum1 = num1.compactMap { $0.wholeNumberValue }
        var newNum2 = num2.compactMap { $0.wholeNumberValue }
        var res = ""
        var carry = 0

        while !newNum1.isEmpty || !newNum2.isEmpty {
            let x1 = !newNum1.isEmpty ? newNum1.popLast()! : 0
            let x2 = !newNum2.isEmpty ? newNum2.popLast()! : 0

            let sum = (x1 + x2 + carry)
            carry = sum / 10
            res = "\(sum % 10)\(res)"
        }

        if carry > 0 {
            res = "\(carry)\(res)"
        }

        return res
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(__REPLACE_ME__)
// Space Complexity: O(__REPLACE_ME__)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    func testLeetcodeExample1() {
        XCTAssertEqual(s.addStrings("0", "0"), "0")
    }

    func testLeetcodeExample2() {
        XCTAssertEqual(s.addStrings("1", "0"), "1")
    }

    func testLeetcodeExample3() {
        XCTAssertEqual(s.addStrings("9", "99"), "108")
    }
}

Tests.defaultTestSuite.run()
