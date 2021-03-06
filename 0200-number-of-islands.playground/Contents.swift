import Foundation

// 200. Number of Islands
// https://leetcode.com/problems/number-of-islands

// MARK: - Solution
// ================
class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }

        var count = 0
        var grid = grid

        for r in 0..<grid.count {
            for c in 0..<grid[r].count where grid[r][c] == "1" {
                count += dfs(&grid, r, c)
            }
        }

        return count
    }

    @discardableResult
    func dfs(_ grid: inout [[Character]], _ r: Int, _ c: Int) -> Int {
        if r < 0 || r >= grid.count || c < 0 || c >= grid[r].count || grid[r][c] == "0" {
            return 0
        }

        grid[r][c] = "0"
        dfs(&grid, r + 1, c)
        dfs(&grid, r - 1, c)
        dfs(&grid, r, c - 1)
        dfs(&grid, r, c + 1)

        return 1
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2)
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        let grid: [[Character]] = [
            ["1", "1", "1", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "0", "0", "0"]
        ]
        XCTAssertEqual(s.numIslands(grid), 1)
    }

    func testLeetCodeExample2() {
        let grid: [[Character]] = [
            ["1", "1", "0", "0", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "1", "0", "0"],
            ["0", "0", "0", "1", "1"]
        ]
        XCTAssertEqual(s.numIslands(grid), 3)
    }

    // Additional Examples
    func testAdditionalExamples() {
        let grid: [[Character]] = [
            ["0", "0", "0", "0", "0"],
            ["0", "0", "0", "0", "0"],
            ["0", "0", "0", "0", "0"],
            ["0", "0", "0", "0", "0"]
        ]
        XCTAssertEqual(s.numIslands(grid), 0)
    }
}

Tests.defaultTestSuite.run()
