import Foundation

// 204. Count Primes
// https://leetcode.com/problems/count-primes

// MARK: - Solution
// ================
class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else { return 0 }

        var primes = [Bool](repeating: true, count: n)
        primes[0] = false
        primes[1] = false

        var p = 2

        while (p * p) <= n {
            if primes[p] {
                for i in stride(from: (p * p), to: n, by: p) {
                    primes[i] = false
                }
            }
            p += 1
        }

        return primes.filter { $0 }.count
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
        XCTAssertEqual(s.countPrimes(10), 4)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.countPrimes(0), 0)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.countPrimes(1), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.countPrimes(0), 0)
    }
}

Tests.defaultTestSuite.run()
