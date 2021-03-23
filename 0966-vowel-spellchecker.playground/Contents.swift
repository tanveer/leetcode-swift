import Foundation

// 966. Vowel Spellchecker
// https://leetcode.com/problems/vowel-spellchecker

// MARK: - Solution
// ================
class Solution {
    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        let exact = Set<String>(wordlist)
        var caseInsensitive = [String: String]()
        var consonant = [String: String]()

        for word in wordlist {
            let santaized = sanatizeWord(word.lowercased())
            if caseInsensitive[word.lowercased()] == nil {
                caseInsensitive[word.lowercased()] = word
            }
            if consonant[santaized] == nil {
                consonant[santaized] = word
            }
        }

        var result = [String]()
        for query in queries {
            if exact.contains(query) {
                result.append(query)
            } else if let word = caseInsensitive[query.lowercased()] {
                result.append(word)
            } else if let word = consonant[sanatizeWord(query.lowercased())] {
                result.append(word)
            } else {
                result.append("")
            }
        }

        return result
    }

    func sanatizeWord(_ word: String) -> String {
        var result = ""
        for char in word {
            result.append(isVowel(char) ? "*" : char)
        }
        return result
    }

    func isVowel(_ char: Character) -> Bool {
        let vowels = Set<Character>(["a", "e", "i", "o", "u"])
        return vowels.contains(char)
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(wordList + queries)
// Space Complexity: O(wordList + queries)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.spellchecker(["KiTe", "kite", "hare", "Hare"], ["kite", "Kite", "KiTe", "Hare", "HARE", "Hear", "hear", "keti", "keet", "keto"]), ["kite", "KiTe", "KiTe", "Hare", "hare", "", "", "KiTe", "", "KiTe"])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.spellchecker([], []), [])
    }
}

Tests.defaultTestSuite.run()
