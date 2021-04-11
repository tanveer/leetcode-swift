import Foundation

// 63. Unique Paths II
// https://leetcode.com/problems/unique-paths-ii

// MARK: - Solution
// ================
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let cols = obstacleGrid[0].count
        var dp = [Int](repeating: 0, count: cols)
        dp[0] = 1

        for row in obstacleGrid {
            for c in 0..<cols {
                if row[c] == 1 {
                    dp[c] = 0
                } else if c > 0 {
                    dp[c] += dp[c - 1]
                }
            }
        }
        return dp[cols - 1]
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(m x n)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.uniquePathsWithObstacles([
            [0, 0, 0],
            [0, 1, 0],
            [0, 0, 0],
        ]), 2)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.uniquePathsWithObstacles([
            [0, 1],
            [0, 0],
        ]), 1)
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.uniquePathsWithObstacles([
            [1, 0],
        ]), 0)
    }

    func testLeetCodeTest2() {
        XCTAssertEqual(s.uniquePathsWithObstacles([
            [0, 0],
            [1, 1],
            [0, 0],
        ]), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.uniquePathsWithObstacles([[0]]), 1)
        XCTAssertEqual(s.uniquePathsWithObstacles([[1]]), 0)
    }
}

Tests.defaultTestSuite.run()
