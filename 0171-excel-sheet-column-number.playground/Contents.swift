import Foundation

// 171. Excel Sheet Column Number
// https://leetcode.com/problems/excel-sheet-column-number

// MARK: - Solution
// ================
class Solution {
    func titleToNumber(_ s: String) -> Int {
        var res = 0
        for c in s {
            let digit = c.asciiValue! - Character("A").asciiValue!  + 1
            res = res*26 + Int(digit)
        }

        return res
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
        XCTAssertEqual(s.titleToNumber("A"), 1)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.titleToNumber("AB"), 28)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.titleToNumber("ZY"), 701)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.titleToNumber(""), 0)
    }
}

Tests.defaultTestSuite.run()
