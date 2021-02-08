import Foundation

// 819. Most Common Word
// https://leetcode.com/problems/most-common-word

// MARK: - Solution
// ================
class Solution {
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        let words = paragraph.lowercased().split { !$0.isLetter }.map { String($0) }
        var permissible = ""
        let wordsCount = words.reduce(into: [:]) { dict, word in
            dict[word, default: 0] += 1
        }

        var count = 0

        for word in words {
            if !banned.contains(String(word)) {
                if let value = wordsCount[word], value > count {
                    permissible = String(word)
                    count = value
                }
            }
        }

        return permissible
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
    func testLeetCodeExample() {
        XCTAssertEqual(s.mostCommonWord("Bob hit a ball, the hit BALL flew far after it was hit.", ["hit"]), "ball")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.mostCommonWord("", []), "")
    }
}

Tests.defaultTestSuite.run()
