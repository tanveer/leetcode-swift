import Foundation

// 371. Sum of Two Integers
// https://leetcode.com/problems/sum-of-two-integers

// MARK: - Solution
// ================
class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b

        while b != 0 {
            let carry = a & b
            a = a ^ b
            b = carry << 1
        }

        return a
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
        XCTAssertEqual(s.getSum(1, 2), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.getSum(-2, 3), 1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.getSum(0, 0), 0)
    }
}

Tests.defaultTestSuite.run()
