import Foundation

// 733. Flood Fill
// https://leetcode.com/problems/flood-fill

// MARK: - Solution
// ================
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        if image[sr][sc] == newColor { return image }
        var image = image
        let color = image[sr][sc]
        
        var stack = [(row: sr, col: sc)]
        
        while !stack.isEmpty {
            let (row, col) = stack.removeLast()
            if image[row][col] == color {
                image[row][col] = newColor
                if row+1 < image.count {
                    stack.append((row+1, col))
                }
                
                if row-1 >= 0 {
                    stack.append((row-1, col))
                }
                
                if col+1 < image[0].count {
                    stack.append((row, col+1))
                }
                
                if col-1 >= 0 {
                    stack.append((row, col-1))
                }
            }
        }
        return image
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
    func testLeetCodeExample1() {
        XCTAssertEqual(s.floodFill([[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2), [[2, 2, 2], [2, 2, 0], [2, 0, 1]])
    }
}

Tests.defaultTestSuite.run()

