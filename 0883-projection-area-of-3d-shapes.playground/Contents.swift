import Foundation

// 883. Projection Area of 3D Shapes
// https://leetcode.com/problems/projection-area-of-3d-shapes

// MARK: - Solution
// ================
class Solution {
    func projectionArea(_ grid: [[Int]]) -> Int {
        let count = grid.count
        var topProjectionCount = 0

        for r in 0..<count {
            var row = 0
            var col = 0
            for c in 0..<count {
                if grid[r][c] > 0 {
                    topProjectionCount += 1
                }
                row = max(row, grid[r][c])
                col = max(col, grid[c][r])
            }
            topProjectionCount += row + col
        }
        return topProjectionCount
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2)
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.projectionArea([[2]]), 5)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.projectionArea([[1, 2], [3, 4]]), 17)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.projectionArea([[1, 0], [0, 2]]), 8)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.projectionArea([[1, 1, 1], [1, 0, 1], [1, 1, 1]]), 14)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.projectionArea([[2, 2, 2], [2, 1, 2], [2, 2, 2]]), 21)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.projectionArea([]), 0)
    }
}

Tests.defaultTestSuite.run()
