import Foundation

// 766. Toeplitz Matrix
// https://leetcode.com/problems/toeplitz-matrix

// MARK: - Solution
// ================
class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        for i in 0..<matrix.count - 1 {
            for j in 0..<matrix[i].count - 1 {
                if matrix[i][j] != matrix[i+1][j+1] {
                    return false
                }
            }
        }
        
        return true
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(M,N)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.isToeplitzMatrix([[1, 2, 3, 4],
                                           [5, 1, 2, 3],
                                           [9, 5, 1, 2]]), true)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.isToeplitzMatrix([[1, 2],[2, 2]]), false)
    }
}

Tests.defaultTestSuite.run()

