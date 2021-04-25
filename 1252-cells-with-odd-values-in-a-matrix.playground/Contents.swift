import Foundation

// 1252. Cells with Odd Values in a Matrix
// https://leetcode.com/problems/cells-with-odd-values-in-a-matrix

// MARK: - Solution
// ================
class Solution {
    func oddCells(_ n: Int, _ m: Int, _ indices: [[Int]]) -> Int {
        var matrix = Array(repeating: Array(repeating: 0, count: m), count: n)
        var res = 0

        for pair in indices {
            let row = pair[0]
            let col = pair[1]

            for c in matrix[row].indices {
                matrix[row][c] += 1
                if !matrix[row][c].isMultiple(of: 2) {
                    res += 1
                } else {
                    res -= 1
                }
            }

            for r in matrix.indices {
                matrix[r][col] += 1
                if !matrix[r][col].isMultiple(of: 2) {
                    res += 1
                } else {
                    res -= 1
                }
            }
        }

        return res
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(?)
// Space Complexity: O(n * m)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.oddCells(2, 3, [[0, 1], [1, 1]]), 6)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.oddCells(2, 2, [[1, 1], [0, 0]]), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.oddCells(0, 0, []), 0)
    }
}

Tests.defaultTestSuite.run()
