import Foundation

// 867. Transpose Matrix
// https://leetcode.com/problems/transpose-matrix

// MARK: - Solution
// ================
class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        guard !matrix.isEmpty else { return [] }
        let row = matrix.count
        let col = matrix[0].count
        var flippedMatrix = [[Int]](repeating: [Int](repeating: 0, count: row), count: col)

        for r in 0..<row {
            for c in 0..<col {
                flippedMatrix[c][r] = matrix[r][c]
            }
        }
        return flippedMatrix
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(r * c) // row * columns
// Space Complexity: O(r * c) // row * columns


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]]), [[1, 4, 7], [2, 5, 8], [3, 6, 9]])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.transpose([[1, 2, 3], [4, 5, 6]]), [[1, 4], [2, 5], [3, 6]])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.transpose([]), [])
    }
}

Tests.defaultTestSuite.run()
