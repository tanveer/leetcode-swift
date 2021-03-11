import Foundation

// 322. Coin Change
// https://leetcode.com/problems/coin-change

// MARK: - Solution
// ================
class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var nums = Array(repeating: amount + 1, count: amount + 1)
        nums[0] = 0

        for coin in coins {
            for num in 0..<nums.count where coin <= num {
                nums[num] = min(nums[num], nums[num - coin] + 1)
            }
        }
        return nums[amount] <= amount ? nums[amount] : -1
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(coin * amount)
// Space Complexity: O(amount)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.coinChange([1, 2, 5], 11), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.coinChange([2], 3), -1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.coinChange([1], 0), 0)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.coinChange([1], 1), 1)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.coinChange([1], 2), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.coinChange([1, 4, 9], 13), 2) // 9 + 4
        XCTAssertEqual(s.coinChange([1, 4, 9], 12), 3) // 4 + 4 + 4 not 9 + 1 + 1 + 1
    }
}

Tests.defaultTestSuite.run()
