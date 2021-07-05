import Foundation

// 695. Max Area of Island
// https://leetcode.com/problems/max-area-of-island

// MARK: - Solution
// ================
class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maxArea = 0
        var originalGrid = grid

        for (r, row) in originalGrid.enumerated() {
            for c in row.indices where originalGrid[r][c] == 1 {
                maxArea = max(dfs(&originalGrid, r, c), maxArea)
            }
        }
        return maxArea
    }

    func dfs(_ grid: inout [[Int]], _ row: Int, _ col: Int) -> Int {
        let rowCount = grid.count
        let colCount = grid[0].count

        let isWater = row == 0 || col == 0 || row >= rowCount || col >= colCount || grid[row][col] != 1
        guard !isWater else { return 0 }

        grid[row][col] = 2
        var area = 1
        area += dfs(&grid, row + 1, col)
        area += dfs(&grid, row - 1, col)
        area += dfs(&grid, row, col + 1)
        area += dfs(&grid, col, col - 1)
        return area
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(M x N)
// Space Complexity: O(M x N)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    let grid = [
        [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
        [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
        [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0],
    ]

    // LeetCode Examples
    func testAdditionalExamples1() {
        XCTAssertEqual(s.maxAreaOfIsland(grid), 6)
    }

    // Additional Examples
    func testAdditionalExamples2() {
        XCTAssertEqual(s.maxAreaOfIsland([[0, 0, 0, 0, 0, 0, 0, 0]]), 0)
    }
}

Tests.defaultTestSuite.run()
