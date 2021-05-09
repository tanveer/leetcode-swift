import Foundation

// 1475. Final Prices With a Special Discount in a Shop
// https://leetcode.com/problems/final-prices-with-a-special-discount-in-a-shop

// MARK: - Solution
// ================
class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        guard !prices.isEmpty else { return [] }

        var discountedPrices = [Int](repeating: 0, count: prices.count)
        var stack = [Int]()

        for i in 0..<prices.count {
            while !stack.isEmpty, prices[i] <= prices[stack[stack.count - 1]] {
                let price = stack.removeLast()
                discountedPrices[price] -= prices[i]
            }

            discountedPrices[i] = prices[i]
            stack.append(i)
        }

        return discountedPrices
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
        XCTAssertEqual(s.finalPrices([8, 4, 6, 2, 3]), [4, 2, 4, 2, 3])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.finalPrices([1, 2, 3, 4, 5]), [1, 2, 3, 4, 5])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.finalPrices([10, 1, 1, 6]), [9, 0, 1, 6])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.finalPrices([]), [])
    }
}

Tests.defaultTestSuite.run()

