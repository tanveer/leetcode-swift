import Foundation

// 59. Spiral Matrix II
// https://leetcode.com/problems/spiral-matrix-ii

// MARK: - Solution
// ================
class Solution {
    enum Direction {
        case right
        case left
        case up
        case down
    }
    
    func generateMatrix(_ n: Int) -> [[Int]] {
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var direction: Direction = .right
        
        var currentRow = 0
        var currentCol = 0
        var minRow = 0
        var minCol = 0
        var maxRow = n - 1
        var maxCol = n - 1
        var currentNum = 1
        
        while minRow <= maxRow && minCol <= maxCol {
            matrix[currentRow][currentCol] = currentNum
            currentNum += 1
            
            switch direction {
            case .right:
                if currentCol < maxCol {
                    currentCol += 1
                } else {
                    currentRow += 1
                    minRow += 1
                    direction = .down
                }
            case .down:
                if currentRow < maxRow {
                    currentRow += 1
                } else {
                    currentCol -= 1
                    maxCol -= 1
                    direction = .left
                }
            case .left:
                if currentCol > minCol {
                    currentCol -= 1
                } else {
                    currentRow -= 1
                    maxRow -= 1
                    direction = .up
                }
            case .up:
                if currentRow > minRow {
                    currentRow -= 1
                } else {
                    currentCol += 1
                    minCol += 1
                    direction = .right
                }
            }
        }
        
        return matrix
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(__REPLACE_ME__)
// Space Complexity: O(__REPLACE_ME__)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample() {
        let expected = [
            [1, 2, 3],
            [8, 9, 4],
            [7, 6, 5],
        ]
        XCTAssertEqual(s.generateMatrix(3), expected)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        func testLeetCodeExample() {
            let expected = [
                [1,  2,  3,  4],
                [12, 13, 14, 5],
                [11, 18, 15, 6],
                [10, 17, 16, 7],
            ]
            XCTAssertEqual(s.generateMatrix(4), expected)
        }
        
        XCTAssertEqual(s.generateMatrix(0), [])
    }
}

Tests.defaultTestSuite.run()
