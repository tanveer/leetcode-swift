import Foundation

// 771. Jewels and Stones
// https://leetcode.com/problems/jewels-and-stones

// MARK: - Solution
// ================
class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var count = 0
        let jewelSet = Set<Character>(jewels)

        for stone in stones {
            if jewelSet.contains(stone) {
                count += 1
            }
        }

        return count
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
        XCTAssertEqual(s.numJewelsInStones("aA", "aAAbbbb"), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.numJewelsInStones("z", "ZZ"), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.numJewelsInStones("", ""), 0)
    }
}

Tests.defaultTestSuite.run()
