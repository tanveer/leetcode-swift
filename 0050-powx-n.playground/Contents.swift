import Foundation

// 50. Pow(x, n)
// https://leetcode.com/problems/powx-n

// MARK: - Solution
// ================
class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        var result = 0.0
        if n == 0 {
            return 1.0
        }

        if n == 1 {
            return x
        }

        if n < 0 {
            return myPow(1 / x, -n)
        }

        result = myPow(x * x, n / 2)
        if n % 2 == 1 {
            result *= x
        }

        return result
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(log(n))
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.myPow(2.00000, 10), 1024.00000)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.myPow(2.10000, 3), 9.26100, accuracy: 0.00001)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.myPow(2.00000, -2), 0.25000)
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.myPow(0.00001, 2147483647), 0.0)
    }

    func testLeetCodeTest2() {
        XCTAssertEqual(s.myPow(34.00515, -3), 2.543114507074558e-05, accuracy: 0.00001)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.myPow(5.0, 0), 1.0)
    }
}

Tests.defaultTestSuite.run()
