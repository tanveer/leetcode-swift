import Foundation

// 859. Buddy Strings
// https://leetcode.com/problems/buddy-strings

// MARK: - Solution
// ================
class Solution {
    func buddyStrings(_ A: String, _ B: String) -> Bool {
        guard A.count == B.count else { return false }

        if A == B {
            return Set(A).count < A.count
        }

        let difference: [(char1: String.Element, char2: String.Element)] = zip(A, B).filter { $0 != $1 }
        if difference.count != 2 {
            return false
        }

        return difference[0].char1 == difference[1].char2 && difference[0].char2 == difference[1].char1
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n + m)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.buddyStrings("ab", "ba"))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.buddyStrings("ab", "ab"))
    }

    func testLeetCodeExample3() {
        XCTAssertTrue(s.buddyStrings("aa", "aa"))
    }

    func testLeetCodeExample4() {
        XCTAssertTrue(s.buddyStrings("aaaaaaabc", "aaaaaaacb"))
    }

    func testLeetCodeExample5() {
        XCTAssertFalse(s.buddyStrings("", "aa"))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.buddyStrings("", ""))
    }
}

Tests.defaultTestSuite.run()
