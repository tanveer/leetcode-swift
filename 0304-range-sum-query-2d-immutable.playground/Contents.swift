import Foundation

// 304. Range Sum Query 2D - Immutable
// https://leetcode.com/problems/range-sum-query-2d-immutable

// MARK: - Solution
// ================
class NumMatrix {
    private var dp: [[Int]]
    private var matrix: [[Int]]

    init(_ matrix: [[Int]]) {
        self.matrix = matrix
        let rows = matrix.count
        let cols = matrix[0].count
        dp = [[Int]](repeating: [Int](repeating: 0, count: cols + 1), count: rows + 1)

        for r in 0..<rows {
            for c in 0..<cols {
                dp[r + 1][c + 1] = matrix[r][c] + dp[r][c + 1] + dp[r + 1][c] - dp[r][c]
            }
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        return dp[row2 + 1][col2 + 1] - dp[row2 + 1][col1] - dp[row1][col2 + 1] + dp[row1][col1]
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(m x n)
// Space Complexity: O(m x n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let matrix = [
            [3, 0, 1, 4, 2],
            [5, 6, 3, 2, 1],
            [1, 2, 0, 1, 5],
            [4, 1, 0, 1, 7],
            [1, 0, 3, 0, 5],
        ]
        let numMatrix = NumMatrix(matrix)
        XCTAssertEqual(numMatrix.sumRegion(2, 1, 4, 3), 8)  // return 8 (i.e sum of the red rectangele).
        XCTAssertEqual(numMatrix.sumRegion(1, 1, 2, 2), 11) // return 11 (i.e sum of the green rectangele).
        XCTAssertEqual(numMatrix.sumRegion(1, 2, 2, 4), 12) // return 12 (i.e sum of the blue rectangele).
    }
}

Tests.defaultTestSuite.run()
