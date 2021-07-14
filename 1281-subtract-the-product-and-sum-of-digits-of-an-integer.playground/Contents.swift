import Foundation

// 1281. Subtract the Product and Sum of Digits of an Integer
// https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer

// MARK: - Solution
// ================
class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        let nums = String(n).map { Int($0.wholeNumberValue ?? 0) }
        guard let firstDigit = nums.first else { return 0 }

        var product = firstDigit
        var sum = firstDigit

        for n in nums.dropFirst() {
            sum += n
            product *= n
        }
        return product - sum
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
        XCTAssertEqual(s.subtractProductAndSum(234), 15)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.subtractProductAndSum(4421), 21)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.subtractProductAndSum(0), 0)
    }
}

Tests.defaultTestSuite.run()
