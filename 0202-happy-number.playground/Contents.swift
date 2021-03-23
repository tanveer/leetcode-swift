import Foundation

// 202. Happy Number
// https://leetcode.com/problems/happy-number

// MARK: - Solution
// ================
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var visited = Set<Int>()
        var value = n

        while value != 1 {
            if !visited.insert(value).inserted {
                return false
            }

            let digits = String(value).map { $0 }
            var num = 0
            for digit in digits {
                let n = Int(String(digit)) ?? 0
                num += n * n
            }

            value = num
        }
        return true
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
        XCTAssertTrue(s.isHappy(19))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.isHappy(2))
    }

    // Additional Examples
    func testAdditionalExamples() {
        let knownHappyNumbers = Set([1, 7, 10, 13, 19, 23, 28, 31, 32, 44, 49, 68, 70, 79, 82, 86, 91, 94, 97, 100])
        for i in 0...100 {
            let knownToBeHappy = knownHappyNumbers.contains(i)
            XCTAssertEqual(s.isHappy(i), knownToBeHappy, "Failed For Number \(i)")
        }
    }
}

Tests.defaultTestSuite.run()
