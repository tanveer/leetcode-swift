import Foundation

// 821. Shortest Distance to a Character
// https://leetcode.com/problems/shortest-distance-to-a-character

// MARK: - Solution
// ================
class Solution {
    func shortestToChar(_ S: String, _ C: Character) -> [Int] {
        var resultArray = [Int](repeating: Int.max, count: S.count)
        var currentPosition = -S.count

        for (i, c) in S.enumerated() {
            if c == C {
                currentPosition = i
            }
            resultArray[i] = i - currentPosition
        }

        for (i, c) in S.enumerated().reversed() {
            if c == C {
                currentPosition = i
            }

            resultArray[i] = min(resultArray[i], abs(i - currentPosition))
        }

        return resultArray
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
        XCTAssertEqual(s.shortestToChar("loveleetcode", "e"), [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.shortestToChar("", "e"), [])
    }
}

Tests.defaultTestSuite.run()

