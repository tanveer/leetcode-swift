import Foundation

// 139. Word Break
// https://leetcode.com/problems/word-break

// MARK: - Solution
// ================
class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard !s.isEmpty else { return true }

        let chars = [Character](s)
        let wordDictSet = Set<String>(wordDict)
        var dp: [Bool] = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true

        for i in 1...chars.count {
            for j in 0..<i {
                let current = String(chars[j..<i])
                if dp[j] && wordDictSet.contains(current) {
                    dp[i] = true
                }
            }
        }

        return dp[chars.count]
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
        XCTAssertTrue(s.wordBreak("leetcode", ["leet", "code"]))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.wordBreak("applepenapple", ["apple", "pen"]))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s.wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        // let string = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
        let string = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab" // Shorter version of LeetCode's actual string above
        let wordDict = ["a", "aa", "aaa", "aaaa", "aaaaa", "aaaaaa", "aaaaaaa", "aaaaaaaa", "aaaaaaaaa", "aaaaaaaaaa"]
        XCTAssertFalse(s.wordBreak(string, wordDict))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.wordBreak("", []))
    }
}

Tests.defaultTestSuite.run()
