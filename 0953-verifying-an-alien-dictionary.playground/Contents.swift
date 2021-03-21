import Foundation

// 953. Verifying an Alien Dictionary
// https://leetcode.com/problems/verifying-an-alien-dictionary

// MARK: - Solution
// ================
class Solution1 {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        for (word1, word2) in zip(words, words.dropFirst()) {
            let inOrder = word1.lexicographicallyPrecedes(word2) {
                order.firstIndex(of: $0)! < order.firstIndex(of: $1)!
            }

            if !inOrder {
                return false
            }
        }
        return true
    }
}

class Solution2 {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        var dictionary = [Character: Int]()

        for i in 0..<order.count {
            let char = order[order.index(order.startIndex, offsetBy: i)]
            dictionary[char] = i
        }

        for i in 0..<words.count - 1 {
            let wordA = words[i]
            let wordB = words[i + 1]
            var compaired = false

            for index in 0..<min(wordA.count, wordB.count) {
                let charA = wordA[wordA.index(wordA.startIndex, offsetBy: index)]
                let charB = wordB[wordB.index(wordB.startIndex, offsetBy: index)]

                let mapA = dictionary[charA] ?? -1
                let mapB = dictionary[charB] ?? -1

                if mapA > mapB {
                    return false
                } else if mapA < mapB {
                    compaired = true
                    break
                }
            }

            if !compaired, wordA.count > wordB.count {
                return false
            }
        }

        return true
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
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s1.isAlienSorted(["hello", "leetcode"], "hlabcdefgijkmnopqrstuvwxyz"))
        XCTAssertTrue(s2.isAlienSorted(["hello", "leetcode"], "hlabcdefgijkmnopqrstuvwxyz"))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s1.isAlienSorted(["word", "world", "row"], "worldabcefghijkmnpqstuvxyz"))
        XCTAssertFalse(s2.isAlienSorted(["word", "world", "row"], "worldabcefghijkmnpqstuvxyz"))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s1.isAlienSorted(["apple", "app"], "abcdefghijklmnopqrstuvwxyz"))
        XCTAssertFalse(s2.isAlienSorted(["apple", "app"], "abcdefghijklmnopqrstuvwxyz"))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s1.isAlienSorted(["a", "b"], "abcdefghijklmnopqrstuvwxyz"))
        XCTAssertTrue(s2.isAlienSorted(["a", "b"], "abcdefghijklmnopqrstuvwxyz"))
    }
}

Tests.defaultTestSuite.run()
