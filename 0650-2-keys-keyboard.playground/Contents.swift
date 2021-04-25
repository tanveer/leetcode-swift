import Foundation

// 650. 2 Keys Keyboard
// https://leetcode.com/problems/2-keys-keyboard

// MARK: - Solution
// ================
class Solution {
    func minSteps(_ n: Int) -> Int {
        var lastCopied = 0
        var steps = 0
        var presentOnScreen = 1

        while presentOnScreen < n {
            if n.isMultiple(of: presentOnScreen) {
                lastCopied = presentOnScreen
                steps += 1
            }
            steps += 1
            presentOnScreen += lastCopied
        }
        return steps
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
        XCTAssertEqual(s.minSteps(3), 3)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.minSteps(0), 0)
    }
}

Tests.defaultTestSuite.run()
