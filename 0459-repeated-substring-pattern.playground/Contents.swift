import Foundation

// 459. Repeated Substring Pattern
// https://leetcode.com/problems/repeated-substring-pattern

// MARK: - Solution
// ================
class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        let count = s.count
        let chars = [Character](s)
        var longestPrefixSuffix = [Int](repeating: 0, count: count)

        for i in 1..<count {
            var j = longestPrefixSuffix[i - 1]
            while j > 0, chars[i] != chars[j] {
                j = longestPrefixSuffix[j - 1]
            }
            if chars[i] == chars[j] {
                j += 1
            }
            longestPrefixSuffix[i] = j
        }

        let longest = longestPrefixSuffix[count - 1]
        return longest != 0 && (longest % (longest - count) == 0)
    }
}

// MARK: Python solution
/*
 def repeatedSubstringPattern(self, s: str) -> bool:
     charCount = len(s)
     for i in range(charCount // 2): // run loop to 1/2 of the string length
        sub = s[0:i+1] get substring
        if charCount % len(sub) == 0:
            repeatingCount = charCount // len(sub)  // check how many times we have to repeat the sub string
            temp = ""  build sub string
            while repeatingCount > 0:
                temp += sub
                repeatingCount -= 1
            if temp == s: // if temp & s is same we have found the true match
                return True
    return False
 */


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
        XCTAssertTrue(s.repeatedSubstringPattern("abab"))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.repeatedSubstringPattern("aba"))
    }

    func testLeetCodeExample3() {
        XCTAssertTrue(s.repeatedSubstringPattern("abcabcabcabc"))
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertTrue(s.repeatedSubstringPattern("abacababacab"))
    }
}

Tests.defaultTestSuite.run()
