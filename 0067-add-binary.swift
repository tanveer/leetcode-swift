//
//  0067-add-binary.swift
//  
//
//  Created by Tanveer Bashir on 10/9/20.
//

// 67. Add Binary
// https://leetcode.com/problems/add-binary/

// MARK: - Solution
// ================
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        guard a.count != 0 && b.count != 0 else { return "0" }

        let a = a.compactMap{ $0.wholeNumberValue }
        let b = b.compactMap{ $0.wholeNumberValue }

        var i = a.count - 1
        var j = b.count - 1
        var carry = 0
        var ans = ""

        while i >= 0 || j >= 0 {
            var sum = carry
            sum += i >= 0 ? a[i] : 0
            sum += j >= 0 ? b[j] : 0
            ans += "\(sum % 2)"
            carry = (sum / 2)
            i -= 1
            j -= 1
        }

        ans += carry != 0 ? "\(carry)" : ""
        return String(ans.reversed())
    }
}

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExamples() {
        XCTAssertEqual(s.addBinary("11", "1"), "100")
        XCTAssertEqual(s.addBinary("1010", "1011"), "10101")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.addBinary("110010", "110010"), "1100100")
    }
}

Tests.defaultTestSuite.run()


