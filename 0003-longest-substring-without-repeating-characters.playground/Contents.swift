import Foundation

// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters

// MARK: - Solution
// ================
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var charDict = [Character: Int]()
        var maxCount = 0
        for (index, char) in s.enumerated() {
            if let prev = charDict[char] {
                maxCount = charDict.count > maxCount ? charDict.count : maxCount
                charDict = charDict.filter { $1 > prev }
                charDict[char] = index
            } else {
                charDict[char] = index
            }
        }
        maxCount = charDict.count > maxCount ? charDict.count : maxCount
        return maxCount
    }

    func lengthOfLongestSubstring1(_ s: String) -> Int {
        var maxCount = 0
        var pointerA = 0
        var pointerB = 0
        var charSet = Set<Character>()
        let arr = Array(s)

        while pointerB < arr.count {
            if !charSet.contains(arr[pointerB]) {
                charSet.insert(arr[pointerB])
                pointerB += 1
                maxCount = max(charSet.count, maxCount)
            } else {
                charSet.remove(arr[pointerA])
                pointerA += 1
            }
        }

        return maxCount
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
        XCTAssertEqual(s.lengthOfLongestSubstring("abcabcbb"), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.lengthOfLongestSubstring("bbbbb"), 1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.lengthOfLongestSubstring("pwwkew"), 3)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.lengthOfLongestSubstring(""), 0)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.lengthOfLongestSubstring1("abcdef"), 6)
    }
}

Tests.defaultTestSuite.run()
