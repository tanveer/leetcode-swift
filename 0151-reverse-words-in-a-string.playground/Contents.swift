import Foundation

// 151. Reverse Words in a String
// https://leetcode.com/problems/reverse-words-in-a-string

// MARK: - Solution
// ================
class Solution {
    func reverseWords(_ s: String) -> String {
        var words = s.split { $0.isWhitespace }
        var result = ""

        while let lastWord = words.popLast() {
            result.append(String(lastWord) + " ")
        }

        return String(result.dropLast())
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
        XCTAssertEqual(s.reverseWords("the sky is blue"), "blue is sky the")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.reverseWords("  hello world  "), "world hello")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.reverseWords("a good   example"), "example good a")
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.reverseWords("  Bob    Loves  Alice   "), "Alice Loves Bob")
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.reverseWords("Alice does not even like bob"), "bob like even not does Alice")
    }
}

Tests.defaultTestSuite.run()
