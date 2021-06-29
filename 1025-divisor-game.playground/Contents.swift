import Foundation

// 1025. Divisor Game
// https://leetcode.com/problems/divisor-game

// MARK: - Solution
// ================
class Solution {
    func divisorGame(_ N: Int) -> Bool {
        return N.isMultiple(of: 2)
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
        XCTAssertTrue(s.divisorGame(2))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.divisorGame(3))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.divisorGame(0))
    }
}

Tests.defaultTestSuite.run()
