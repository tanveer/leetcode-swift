import Foundation

// 131. Palindrome Partitioning
// https://leetcode.com/problems/palindrome-partitioning

// MARK: - Solution
// ================
class Solution {
    func partition(_ s: String) -> [[String]] {
        let chars = [Character](s)
        var results = [[String]]()
        var validPartitions = [String]()

        func dfs(_ i: Int) {
            if i == s.count {
                results.append(validPartitions)
            } else {
                for j in i..<s.count where isPalindrome(chars, i, j) {
                    validPartitions.append(String(chars[i...j]))
                    dfs(j + 1)
                    validPartitions.removeLast()
                }
            }
        }

        dfs(0)
        return results
    }

    func isPalindrome(_ chars: [Character], _ l: Int, _ r: Int) -> Bool {
        var left = l
        var right = r

        while left < right {
            if chars[left] != chars[right] {
                return false
            }

            left += 1
            right -= 1
        }

        return true
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
        let expected = [
            ["a", "a", "b"],
            ["aa", "b"],
        ]
        XCTAssertEqual(s.partition("aab"), expected)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.partition("a"), [["a"]])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.partition(""), [[]])
    }
}

Tests.defaultTestSuite.run()
