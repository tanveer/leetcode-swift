//
//  Created by Tanveer Bashir on 10/15/20.

// 121. Best Time  to Buy and Sell Stock
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/submissions/

// MARK: - Solution
// ================
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        var min = Int.max
        for p in prices {
            if p < min {
                min = p
            } else {
                maxProfit = max(maxProfit, p - min)
            }
        }
        return maxProfit
    }
}

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.maxProfit([7, 1, 5, 3, 6, 4]), 5)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.maxProfit([7, 6, 4, 3, 1]), 0)
    }
    
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxProfit([]), 0)     // Empty case
        XCTAssertEqual(s.maxProfit([7, 1]), 0) // No profit
        XCTAssertEqual(s.maxProfit([1, 2]), 1) // Small array
    }
}

Tests.defaultTestSuite.run()
