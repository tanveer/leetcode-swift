import Foundation

// 122. Best Time to Buy and Sell Stock II
// https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii

// MARK: - Solution
// ================
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }

        var profit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i-1] {
                profit += max(prices[i] - prices[i-1], 0)
            }
        }

        return profit
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
        XCTAssertEqual(s.maxProfit([7, 1, 5, 3, 6, 4]), 7)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.maxProfit([1, 2, 3, 4, 5]), 4)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.maxProfit([7, 6, 4, 3, 1]), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxProfit([]), 0)
    }
}

Tests.defaultTestSuite.run()

