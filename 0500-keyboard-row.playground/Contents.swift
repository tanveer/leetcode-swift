import Foundation

// 500. Keyboard Row
// https://leetcode.com/problems/keyboard-row

// MARK: - Solution
// ================
class Solution {
    func findWords(_ words: [String]) -> [String] {
        guard !words.isEmpty else { return [] }
        var output = [String]()
        let firstRow = Set<Character>("qwertyuiop")
        let secondRow = Set<Character>("asdfghjkl")
        let thirdRow = Set<Character>("zxcvbnm")

        for word in words {
            if findWord(word, in: firstRow) {
                output.append(word)
            } else if findWord(word, in: secondRow) {
                output.append(word)
            } else if findWord(word, in: thirdRow) {
                output.append(word)
            } else {
                // do nothing
            }
        }
        return output
    }

    func findWord(_ word: String, in row: Set<Character>) -> Bool {
        for char in word.lowercased() {
            if !row.contains(char) {
                return false
            }
        }
        return true
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
    func testLeetCodeExample() {
        XCTAssertEqual(s.findWords(["Hello", "Alaska", "Dad", "Peace"]), ["Alaska", "Dad"])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findWords([]), [])
    }
}

Tests.defaultTestSuite.run()
