import Foundation

// 6. ZigZag Conversion
// https://leetcode.com/problems/zigzag-conversion

// MARK: - Solution
// ================
class Solution1 {
    func convert(_ s: String, _ numRows: Int) -> String {
        if s.count <= 1 {
            return s
        }

        if numRows < 2 {
            return s
        }

        var result = [String](repeating: String(), count: min(s.count, numRows))
        var row = 0 // keep track of row as moving up and down
        var delta = -1

        for char in s {
            result[row] += String(char)
            if row == 0 || row == numRows - 1 {
                delta *= -1
            }
            row += delta
        }
        return result.joined()
    }
}

class Solution2 {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }

        var rows = [String](repeating: "", count: numRows)
        var isAscending = true

        var index = 0
        for char in s {
            rows[index] += String(char)

            if index == 0 {
                isAscending = true
            } else if index == numRows - 1 {
                isAscending = false
            }

            if isAscending {
                index += 1
            } else {
                index -= 1
            }
        }
        return rows.joined()
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
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.convert("PAYPALISHIRING", 3), "PAHNAPLSIIGYIR")
        XCTAssertEqual(s2.convert("PAYPALISHIRING", 3), "PAHNAPLSIIGYIR")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.convert("PAYPALISHIRING", 4), "PINALSIGYAHRPI")
        XCTAssertEqual(s2.convert("PAYPALISHIRING", 4), "PINALSIGYAHRPI")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s1.convert("A", 1), "A")
        XCTAssertEqual(s2.convert("A", 1), "A")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.convert("PAYPALISHIRING", 1), "PAYPALISHIRING")
        XCTAssertEqual(s2.convert("PAYPALISHIRING", 1), "PAYPALISHIRING")
    }
}

Tests.defaultTestSuite.run()
