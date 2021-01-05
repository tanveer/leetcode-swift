import Foundation

// 20. Valid Parentheses
// https://leetcode.com/problems/valid-parentheses

// MARK: - Solution
// ================
class Solution {
    func isValid(_ s: String) -> Bool {
        guard !s.isEmpty else { return false }
        var stack = [Character]()
        
        let bracketPairs: [Character:Character] = [ "{":"}", "[":"]", "(":")" ]
        let openBrackets = "{[("
        let closeBrackets = "}])"
        
        for char in s {
            if openBrackets.contains(char) {
                stack.append(char)
            }
            if closeBrackets.contains(char) {
                guard let last = stack.popLast() else { return false }
                guard bracketPairs[last] == char  else { return false }
            }
        }
        
        return stack.isEmpty
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
        XCTAssertTrue(s.isValid("()"))
    }
    
    func testLeetCodeExample2() {
        XCTAssertTrue(s.isValid("()[]{}"))
    }
    
    func testLeetCodeExample3() {
        XCTAssertFalse(s.isValid("(]"))
    }
    
    func testLeetCodeExample4() {
        XCTAssertFalse(s.isValid("([)]"))
    }
    
    func testLeetCodeExample5() {
        XCTAssertTrue(s.isValid("{[]}"))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.isValid(""))
    }
}

Tests.defaultTestSuite.run()
