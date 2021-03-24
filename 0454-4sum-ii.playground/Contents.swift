import Foundation

// 454. 4Sum II
// https://leetcode.com/problems/4sum-ii

// MARK: - Solution
// ================
class Solution {
    func fourSumCount(_ A: [Int], _ B: [Int], _ C: [Int], _ D: [Int]) -> Int {
        var sum = 0
        var map = [Int: Int]()

        for a in A {
            for b in B {
                map[a + b, default: 0] += 1
            }
        }

        for c in C {
            for d in D {
                if let value = map[-(c + d)] {
                    sum += value
                }
            }
        }
        return sum
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample() {
        XCTAssertEqual(s.fourSumCount([1, 2], [-2, -1], [-1, 2], [0, 2]), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.fourSumCount([], [], [], []), 0)
    }
}

Tests.defaultTestSuite.run()
