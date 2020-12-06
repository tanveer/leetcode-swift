import Foundation

// 661. Image Smoother
// https://leetcode.com/problems/image-smoother

// MARK: - Solution
// ================
class Solution {
    func imageSmoother(_ M: [[Int]]) -> [[Int]] {
        var ans = M
        let rowCount = M.count
        let colCount = M[0].count
        
        for (r, row) in M.enumerated() {
            for (c, _) in row.enumerated() {
                var sum = 0
                var count = 0
                for row in r-1...r+1 where row >= 0 && row < rowCount {
                    for col in c-1...c+1 where col >= 0 && col < colCount {
                        sum += M[row][col]
                        count += 1
                    }
                }
                
                ans[r][c] = sum / count
            }
        }
        
        return ans
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        let input = [
            [1, 1, 1],
            [1, 0, 1],
            [1, 1, 1],
        ]
        let expected = [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0],
        ]
        XCTAssertEqual(s.imageSmoother(input), expected)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        let input = [
            [2, 3, 4],
            [5, 6, 7],
            [8, 9, 10],
            [11, 12, 13],
            [14, 15, 16],
        ]
        let expected = [
            [4, 4, 5],
            [5, 6, 6],
            [8, 9, 9],
            [11, 12, 12],
            [13, 13, 14],
        ]
        XCTAssertEqual(s.imageSmoother(input), expected)
    }
}

Tests.defaultTestSuite.run()

