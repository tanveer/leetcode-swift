import UIKit

// 807 Max Increase to Keep City Skyline
// https://leetcode.com/problems/max-increase-to-keep-city-skyline/

// MARK: - Solution
//=================
class Solution {
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        var maxRow = [Int](repeating: 0, count: grid[0].count)
        var maxColumn = [Int](repeating: 0, count: grid[0].count)
        var result = 0
        
        for (i, row) in grid.enumerated() {
            for (j, num) in row.enumerated() {
                maxRow[i] = max(maxRow[i], num)
                maxColumn[j] = max(maxColumn[j], num)
            }
        }
        
        for (i, row) in grid.enumerated() {
            for (j, _) in row.enumerated() {
                result += min(maxRow[i], maxColumn[j]) - grid[i][j]
            }
        }
        
        return result
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n²) // because of nested loops
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    let testGrid = [ [3, 0, 8, 4],
                     [2, 4, 5, 7],
                     [9, 2, 6, 3],
                     [0, 3, 1, 0] ]
    
    func testLeetcodeExample() {
        XCTAssertEqual(s.maxIncreaseKeepingSkyline(testGrid), 35)
    }
}

Tests.defaultTestSuite.run()

