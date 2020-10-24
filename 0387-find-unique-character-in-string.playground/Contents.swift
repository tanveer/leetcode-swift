import UIKit

// 387. First Unique Character in a String
// https://leetcode.com/problems/first-unique-character-in-a-string

// MARK: - Solution
// ================
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        let arr = Array(s)
        var indexes = [Character: Int]()

        for (i, char) in s.enumerated() {
            if indexes[char] != nil {
                indexes[char] = i + 1
            } else {
                indexes[char] = 1
            }
        }

        for i in 0..<s.count {
            if indexes[arr[i]] == 1 {
                return i
            }
        }
        return -1
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
