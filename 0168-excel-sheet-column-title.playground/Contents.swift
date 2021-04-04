import Foundation

// 168. Excel Sheet Column Title
// https://leetcode.com/problems/excel-sheet-column-title

// MARK: - Solution
// ================
class Solution {
    func convertToTitle(_ n: Int) -> String {
        var original = n
        var result = ""

        while original > 0 {
            let value = Int(Character("A").asciiValue!) + Int((original - 1) % 26)
            let unicode = UnicodeScalar(value)
            let char = Character(unicode!)
            result = String(char) + result

            original = (original - 1) / 26
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
        XCTAssertEqual(s.convertToTitle(1), "A")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.convertToTitle(28), "AB")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.convertToTitle(701), "ZY")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.convertToTitle(0), "")
    }
}

Tests.defaultTestSuite.run()
