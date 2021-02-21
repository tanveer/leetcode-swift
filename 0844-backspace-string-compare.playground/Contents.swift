import Foundation

// 844. Backspace String Compare
// https://leetcode.com/problems/backspace-string-compare

// MARK: - Solution
// ================
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        return processBackspace(S) == processBackspace(T)
    }

    func processBackspace(_ s: String) -> String {
        var output = ""

        for char in s {
            if char == "#" {
                output.popLast()
            } else {
                output.append(char)
            }
        }

        return output
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n + m)
// Space Complexity: O(n + m)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.backspaceCompare("ab#c", "ad#c"))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.backspaceCompare("ab##", "c#d#"))
    }

    func testLeetCodeExample3() {
        XCTAssertTrue(s.backspaceCompare("a##c", "#a#c"))
    }

    func testLeetCodeExample4() {
        XCTAssertFalse(s.backspaceCompare("a#c", "b"))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.backspaceCompare("", ""))
    }
}

Tests.defaultTestSuite.run()
