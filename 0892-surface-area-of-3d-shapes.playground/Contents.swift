import Foundation

// 892. Surface Area of 3D Shapes
// https://leetcode.com/problems/surface-area-of-3d-shapes

// MARK: - Solution
// ================
class Solution {
    func surfaceArea(_ grid: [[Int]]) -> Int {
        var area = 0
        for row in 0..<grid.count {
            for col in 0..<grid[row].count where grid[row][col] > 0 {
                area += grid[row][col] * 4 + 2
                area -= row > 0 ? 2 * min(grid[row][col], grid[row - 1][col]) : 0
                area -= col > 0 ? 2 * min(grid[row][col], grid[row][col - 1]) : 0
            }
        }
        return area
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
        XCTAssertEqual(s.surfaceArea([[2]]), 10)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.surfaceArea([[1, 2], [3, 4]]), 34)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.surfaceArea([[1, 0], [0, 2]]), 16)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.surfaceArea([[1, 1, 1], [1, 0, 1], [1, 1, 1]]), 32)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.surfaceArea([[2, 2, 2], [2, 1, 2], [2, 2, 2]]), 46)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.surfaceArea([]), 0)
    }
}

Tests.defaultTestSuite.run()
