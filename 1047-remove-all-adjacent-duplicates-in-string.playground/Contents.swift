import Foundation

// 1047. Remove All Adjacent Duplicates In String
// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string

// MARK: - Solution
// ================
class Solution {
    func removeDuplicates(_ S: String) -> String {
        guard !S.isEmpty else { return "" }

        var stack = [Character]()

        for index in S.indices {
            if S[index] == stack.last {
                stack.popLast()
            } else {
                stack.append(S[index])
            }
        }
        return String(stack)
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
        XCTAssertEqual(s.removeDuplicates("abbaca"), "ca")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.removeDuplicates("azxxzy"), "ay")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.removeDuplicates(""), "")
    }
}

Tests.defaultTestSuite.run()
