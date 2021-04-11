import Foundation

// 221. Maximal Square
// https://leetcode.com/problems/maximal-square

// MARK: - Solution
// ================
class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else { return 0 }
        let rows = matrix.count
        let cols = matrix[0].count
        var maxNum = 0
        var dp = [[Int]](repeating: [Int](repeating: 0, count: cols), count: rows)

        for r in 0..<rows {
            dp[r][0] = matrix[r][0] == "0" ?  0 : 1
            maxNum = max(maxNum, dp[r][0])
        }

        for c in 0..<cols {
            dp[0][c] = matrix[0][c] == "0" ?  0 : 1
            maxNum = max(maxNum, dp[0][c])
        }

        for r in 1..<rows {
            for c in 1..<cols where matrix[r][c] == "1" {
                dp[r][c] = min(min(dp[r - 1][c], dp[r - 1][c - 1]), dp[r][c - 1]) + 1
                maxNum = max(maxNum, dp[r][c])
            }
        }
        return maxNum * maxNum
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(m * n)
// Space Complexity: O(m * n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        let matrix: [[Character]] = [
            ["1", "0", "1", "0", "0"],
            ["1", "0", "1", "1", "1"],
            ["1", "1", "1", "1", "1"],
            ["1", "0", "0", "1", "0"],
        ]
        XCTAssertEqual(s.maximalSquare(matrix), 4)
    }

    func testLeetCodeExample2() {
        let matrix: [[Character]] = [
            ["0", "1"],
            ["1", "0"],
        ]
        XCTAssertEqual(s.maximalSquare(matrix), 1)
    }

    func testLeetCodeExample3() {
        let matrix: [[Character]] = [["0"]]
        XCTAssertEqual(s.maximalSquare(matrix), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        let matrix: [[Character]] = [["1"]]
        XCTAssertEqual(s.maximalSquare(matrix), 1)
    }
}

Tests.defaultTestSuite.run()
