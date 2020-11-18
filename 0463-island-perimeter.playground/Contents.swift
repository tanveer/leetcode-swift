import Foundation

// 463. Island Perimeter
// https://leetcode.com/problems/island-perimeter

// MARK: - Solution
// ================
class Solution {
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else { return 0 }

        let rows = grid.count
        let columns = grid[0].count
        var perimeter  = 0

        for i in 0..<rows {
            for j in 0..<columns {
                if grid[i][j] == 0 {continue}
                perimeter += 4 // assuming all sides are water

                // decrement when encounter land
                perimeter -= i > 0 ? grid[i-1][j] : 0
                perimeter -= j > 0 ? grid[i][j-1] : 0
                perimeter -= i < rows-1 ? grid[i+1][j] : 0
                perimeter -= j < columns-1 ? grid[i][j+1] : 0
            }
        }

        return perimeter
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n²)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.islandPerimeter([[0, 1, 0, 0], [1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 0, 0]]), 16)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.islandPerimeter([[1]]), 4)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.islandPerimeter([[1, 0]]), 4)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.islandPerimeter([]), 0)
    }
}

Tests.defaultTestSuite.run()
