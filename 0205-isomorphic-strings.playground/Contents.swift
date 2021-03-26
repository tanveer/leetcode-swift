import Foundation

// 205. Isomorphic Strings
// https://leetcode.com/problems/isomorphic-strings

// MARK: - Solution
// ================
class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        let S = [Character](s)
        let T = [Character](t)

        var charMap = [Character: Character]()
        var charSet = Set<Character>()

        for i in 0..<s.count {
            if charMap[S[i]] == nil, charSet.insert(T[i]).inserted {
                charMap[S[i]] = T[i]
            } else if charMap[S[i]] == nil, charSet.contains(T[i]) {
                return false
            } else if charMap[S[i]] != T[i] {
                return false
            }
        }

        return true
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
        XCTAssertTrue(s.isIsomorphic("egg", "add"))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.isIsomorphic("foo", "bar"))
    }

    func testLeetCodeExample3() {
        XCTAssertTrue(s.isIsomorphic("paper", "title"))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.isIsomorphic("", ""))
    }
}

Tests.defaultTestSuite.run()
