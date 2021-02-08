import Foundation

// 788. Rotated Digits
// https://leetcode.com/problems/rotated-digits

// MARK: - Solution
// ================
class Solution {
    func rotatedDigits(_ N: Int) -> Int {
        guard N > 0 else { return 0 }

        var goodNumbers = 0
        for num in 1...N {
            if isGood(num) {
                goodNumbers += 1
            }
        }

        return goodNumbers
    }

    func isGood(_ n: Int) -> Bool {
        var isRotated = false
        var num = n

        while num > 0 {
            let digit = num % 10
            num /= 10
            switch  digit {
            case 0, 1, 8:
                continue
            case 2, 5, 6, 9:
                isRotated = true
            default:
                return false
            }
        }

        return isRotated
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
    func testLeetCodeExample() {
        XCTAssertEqual(s.rotatedDigits(10), 4)
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.rotatedDigits(857), 247)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.rotatedDigits(0), 0)
    }
}

Tests.defaultTestSuite.run()
