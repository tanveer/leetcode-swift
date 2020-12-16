import Foundation

// 746. Min Cost Climbing Stairs
// https://leetcode.com/problems/min-cost-climbing-stairs

// MARK: - Solution
// ================
class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var a = 0
        var b = 0
        
        for n in cost {
            let c = n + min(a, b)
            b = a
            a = c
        }
        
        return min(a, b)
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
    func testLeetCodeExample1() {
        XCTAssertEqual(s.minCostClimbingStairs([10, 15, 20]), 15)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]), 6)
    }
}

Tests.defaultTestSuite.run()

