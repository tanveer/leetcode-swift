import Foundation

// 507. Perfect Number
// https://leetcode.com/problems/perfect-number

// MARK: - Solution
// ================
class Solution {
    func checkPerfectNumber(_ num: Int) -> Bool {
        guard num > 1 else { return false }

        var sum = 1
        var i = 2

        while i <= num / i {
            if num % i == 0 {
                sum += i + (num / i)
            }

            i += 1
        }

        return sum == num
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
        XCTAssertTrue(s.checkPerfectNumber(28))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.checkPerfectNumber(6))
    }

    func testLeetCodeExample3() {
        XCTAssertTrue(s.checkPerfectNumber(496))
    }

    func testLeetCodeExample4() {
        XCTAssertTrue(s.checkPerfectNumber(8128))
    }

    func testLeetCodeExample5() {
        XCTAssertFalse(s.checkPerfectNumber(2))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.checkPerfectNumber(0))
    }
}

Tests.defaultTestSuite.run()
