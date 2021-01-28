import Foundation

// 73. Set Matrix Zeroes
// https://leetcode.com/problems/set-matrix-zeroes

// MARK: - Solution
// ================
class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows = Set<Int>()
        var cols = Set<Int>()

        // traverse to add row and col that are equal to 0
        for row in matrix.indices {
            for col in matrix[0].indices where matrix[row][col] == 0 {
                rows.insert(row)
                cols.insert(col)
            }
        }

        for row in rows {
            for col in matrix[0].indices {
                matrix[row][col] = 0
            }
        }

        for col in cols {
            for row in matrix.indices {
                matrix[row][col] = 0
            }
        }
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(m+n)
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        var inoutInput = [[1, 1, 1], [1, 0, 1], [1, 1, 1]]
        s.setZeroes(&inoutInput)
        XCTAssertEqual(inoutInput, [[1, 0, 1], [0, 0, 0], [1, 0, 1]])
    }

    func testLeetCodeExample2() {
        var inoutInput = [[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]
        s.setZeroes(&inoutInput)
        XCTAssertEqual(inoutInput, [[0, 0, 0, 0], [0, 4, 5, 0], [0, 3, 1, 0]])
    }

    // Additional Examples
    func testAdditionalExamples() {
        var inoutInput: [[Int]] = []
        s.setZeroes(&inoutInput)
        XCTAssertEqual(inoutInput, [])
    }
}

Tests.defaultTestSuite.run()
