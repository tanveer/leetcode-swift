import Foundation

// 292. Nim Game
// https://leetcode.com/problems/nim-game

// MARK: - Solution
// ================
class Solution {
    func canWinNim(_ n: Int) -> Bool {
        var stones = n

        while stones > 0 {
            if stones % 4 == 0 { return false }
            else if stones <= 7 { return true }
            else if stones > 7 {
                if stones % 4 == 1 {
                    return true
                }
                stones -= 1
            }
        }

        return false
    }

    // One line solution
    func canWinNim_simple(_ n: Int) -> Bool {
        guard n != 0 else { return false }
        return n % 4 != 0
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n) // while loop, O(1) with modulus operation
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertFalse(s.canWinNim(4))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.canWinNim(1))
    }

    func testLeetCodeExample3() {
        XCTAssertTrue(s.canWinNim_simple(2))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.canWinNim_simple(0))
    }
}

Tests.defaultTestSuite.run()

