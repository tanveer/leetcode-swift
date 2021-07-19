import Cocoa

// MARK: - 1935 Maximum Number of Words you can type
// https://leetcode.com/problems/maximum-number-of-words-you-can-type/

// MARK: - Solution
// ================
class Solution {
    func canBeTypedWords(_ text: String, _ brokenLetters: String) -> Int {
        let words = text.split(separator: " ")
        var count = 0
        
        outer:
        for word in words {
            for letter in brokenLetters {
                if word.contains(letter) {
                    continue outer
                }
            }
            count += 1
        }
        return count
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
        XCTAssertEqual(s.canBeTypedWords("leet code", "lt"), 1)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.canBeTypedWords("leet code", "e"), 0)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.canBeTypedWords("hello world", "ad"), 1)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.canBeTypedWords("hello world", ""), 2)
    }
}

Tests.defaultTestSuite.run()

