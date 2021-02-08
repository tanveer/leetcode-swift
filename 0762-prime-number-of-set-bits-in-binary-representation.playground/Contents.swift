import Foundation

// 762. Prime Number of Set Bits in Binary Representation
// https://leetcode.com/problems/prime-number-of-set-bits-in-binary-representation

// MARK: - Solution
// ================
class Solution {
    func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
        var primeNumber = 0
        let primes = Set<Int>([2, 3, 5, 7, 11, 13, 17, 19])

        for n in L...R {
            var numberOfSetBit = 0
            var digit = n
            while digit != 0 {
                digit &= (digit - 1)
                numberOfSetBit += 1
            }

            if primes.contains(numberOfSetBit) {
                primeNumber += 1
            }
        }
        return primeNumber
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
        XCTAssertEqual(s.countPrimeSetBits(6, 10), 4)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.countPrimeSetBits(10, 15), 5)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.countPrimeSetBits(8, 8), 0)
    }
}

Tests.defaultTestSuite.run()
