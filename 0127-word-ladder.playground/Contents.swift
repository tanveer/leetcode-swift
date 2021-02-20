import Foundation

// 127. Word Ladder
// https://leetcode.com/problems/word-ladder

// MARK: - Solution
// ================
class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var words = Set<String>()
        for word in wordList {
            words.insert(word)
        }

        if !words.contains(endWord) {
            return 0
        }

        var queue: [String] = [beginWord]
        var level = 1
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let currentWord = queue.removeFirst()
                var chars = Array(currentWord)

                for (i, char) in chars.enumerated() {
                    for character in "abcdefghijklmnopqrstuvwxyz" {
                        if char == character { continue }
                        chars[i] = character
                        let newWord = String(chars)
                        if newWord == endWord {
                            return level + 1
                        }

                        if words.contains(newWord) {
                            queue.append(newWord)
                            words.remove(newWord)
                        }
                    }
                    chars[i] = char // reset back to it's original state
                }
            }
            level += 1 // add one to level
        }
        return 0
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]), 5)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.ladderLength("hit", "cog", ["hot", "dot", "dog", "lot", "log"]), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.ladderLength("", "", []), 0)
    }
}

Tests.defaultTestSuite.run()
