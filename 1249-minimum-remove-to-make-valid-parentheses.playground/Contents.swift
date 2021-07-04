import Foundation

// 1249. Minimum Remove to Make Valid Parentheses
// https://leetcode.com/problems/minimum-remove-to-make-valid-parentheses

// MARK: - Solution
// ================
class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var stack = [Int]()
        var indexToRemoveFromInputString = Set<Int>()

        for (idx, char) in s.enumerated() {
            if char == "(" {
                stack.append(idx)
            }

            if char == ")" {
                if stack.isEmpty {
                    indexToRemoveFromInputString.insert(idx)
                } else {
                    stack.removeLast()
                }
            }
        }

        while !stack.isEmpty {
            let last = stack.popLast() ?? -1
            indexToRemoveFromInputString.insert(last)
        }

        var output = ""
        for (idx, char) in s.enumerated() {
            if !indexToRemoveFromInputString.contains(idx) {
                output.append(char)
            }
        }

        return output
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
        XCTAssertEqual(s.minRemoveToMakeValid("lee(t(c)o)de)"), "lee(t(c)o)de")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.minRemoveToMakeValid("a)b(c)d"), "ab(c)d")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.minRemoveToMakeValid("))(("), "")
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.minRemoveToMakeValid("(a(b(c)d)"), "a(b(c)d)")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.minRemoveToMakeValid(""), "")
    }
}

Tests.defaultTestSuite.run()
