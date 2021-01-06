import Foundation

// 48. Rotate Image
// https://leetcode.com/problems/rotate-image

// MARK: - Solution
// ================
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        matrix.reverse()
        for (r,row) in matrix.enumerated()  {
            for (c,_) in row.enumerated() where c >= r {
                (matrix[r][c], matrix[c][r]) = (matrix[c][r], matrix[r][c])
            }
        }
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
        var inoutInput = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
        s.rotate(&inoutInput)
        XCTAssertEqual(inoutInput, [[7, 4, 1], [8, 5, 2], [9, 6, 3]])
    }
    
    func testLeetCodeExample2() {
        var inoutInput = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
        s.rotate(&inoutInput)
        XCTAssertEqual(inoutInput, [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]])
    }
    
    func testLeetCodeExample3() {
        var inoutInput = [[1]]
        s.rotate(&inoutInput)
        XCTAssertEqual(inoutInput, [[1]])
    }
    
    func testLeetCodeExample4() {
        var inoutInput = [[1, 2], [3, 4]]
        s.rotate(&inoutInput)
        XCTAssertEqual(inoutInput, [[3, 1], [4, 2]])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        var inoutInput: [[Int]] = []
        s.rotate(&inoutInput)
        XCTAssertEqual(inoutInput, [])
    }
}

Tests.defaultTestSuite.run()
