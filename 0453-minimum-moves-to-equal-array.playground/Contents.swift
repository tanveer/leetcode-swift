import Foundation

// 453. Minimum Moves to Equal Array Elements
// https://leetcode.com/problems/minimum-moves-to-equal-array-elements

// MARK: - Solution
// ================
class Solution {
    func minMoves(_ nums: [Int]) -> Int {
        var minValue = nums.first!
        var sum = 0
        
        for n in nums {
            if minValue > n {
                minValue = n
            }
            sum += n
        }
        
        return sum - minValue * nums.count
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample() {
        XCTAssertEqual(s.minMoves([1, 2, 3]), 3)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.minMoves([]), 0)
    }
}

Tests.defaultTestSuite.run()
