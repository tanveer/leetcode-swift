import Foundation

// 884. Uncommon Words from Two Sentences
// https://leetcode.com/problems/uncommon-words-from-two-sentences

// MARK: - Solution
// ================
class Solution1 {
    func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
        guard !A.isEmpty && !B.isEmpty else { return [] }

        var wordCount = A.split(separator: " ").reduce(into: [:]) { dict, word in
            dict[String(word), default: 0] += 1
        }

        for word in B.split(separator: " ") {
            wordCount[String(word), default: 0] += 1
        }

        return Array(wordCount.filter { $0.value == 1 }.keys)
    }
}

class Solution2 {
    func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
        guard !A.isEmpty && !B.isEmpty else { return [] }
        let wordCount = [A, B].joined(separator: " ").components(separatedBy: " ").reduce(into: [:]) { dict, word in
            dict[word, default: 0] += 1
        }
        return Array(wordCount.filter { $0.value == 1 }.keys)
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(m + n)
// Space Complexity: O(m + n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.uncommonFromSentences("this apple is sweet", "this apple is sour"), ["sour", "sweet"])
        XCTAssertEqual(s2.uncommonFromSentences("this apple is sweet", "this apple is sour"), ["sweet", "sour"])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.uncommonFromSentences("apple apple", "banana"), ["banana"])
        XCTAssertEqual(s2.uncommonFromSentences("apple apple", "banana"), ["banana"])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.uncommonFromSentences("", ""), [])
        XCTAssertEqual(s2.uncommonFromSentences("", ""), [])
    }
}

Tests.defaultTestSuite.run()
