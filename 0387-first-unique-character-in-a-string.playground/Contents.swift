import Foundation

// 387. First Unique Character in a String
// https://leetcode.com/problems/first-unique-character-in-a-string

// MARK: - Solution
// ================
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let charCount = s.reduce(into: [:]) { dict, char in
            dict[char, default: 0] += 1
        }

        for i in s.indices where charCount[s[i]] == 1 {
            return s.distance(from: s.startIndex, to: i)
        }
        return -1
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
        XCTAssertEqual(s.firstUniqChar("leetcode"), 0)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.firstUniqChar("loveleetcode"), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.firstUniqChar(""), -1)
        XCTAssertEqual(s.firstUniqChar("aa"), -1)
    }
}

Tests.defaultTestSuite.run()
