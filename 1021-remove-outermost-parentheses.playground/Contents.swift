import Foundation

// 1021. Remove Outermost Parentheses
// https://leetcode.com/problems/remove-outermost-parentheses

// MARK: - Solution
// ================
class Solution {
    func removeOuterParentheses(_ s: String) -> String {
        var output = ""
        var counter = 0
        let openBrace: Character = "("
        let closeBrace: Character = ")"


        for char in s {
            switch char {
            case openBrace:
                counter += 1
                if counter > 1 {
                    output.append(openBrace)
                }
            case closeBrace:
                counter -= 1
                if counter > 0 {
                    output.append(closeBrace)
                }
            default:
                break
            }
        }
        return output
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
        XCTAssertEqual(s.removeOuterParentheses("(()())(())"), "()()()")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.removeOuterParentheses("(()())(())(()(()))"), "()()()()(())")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.removeOuterParentheses("()()"), "")
    }
}

Tests.defaultTestSuite.run()
