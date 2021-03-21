import Foundation

// 395. Longest Substring with At Least K Repeating Characters
// https://leetcode.com/problems/longest-substring-with-at-least-k-repeating-characters

// MARK: - Solution
// ================
class Solution {
    func longestSubstring(_ s: String, _ k: Int) -> Int {
        guard !s.isEmpty else { return 0 }
        let chars = [Character](s)
        let charsCount = s.reduce(into: [:]) { dict, char in
            dict[char, default: 0] += 1
        }

        var index = 0
        while index < s.count, charsCount[chars[index]]! >= k {
            index += 1
        }

        if index == s.count {
            return s.count
        }

        let left = longestSubstring(String(chars[0..<index]), k)
        while index < s.count, charsCount[chars[index]]! < k {
            index += 1
        }

        let right = longestSubstring(String(chars[index..<s.count]), k)
        return max(left, right)
    }
}

extension StringProtocol {
    subscript(_ offset: Int) -> Element {
        return self[index(startIndex, offsetBy: offset)]
    }

    subscript(_ range: Range<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count).suffix(range.count)
    }

    subscript(_ range: ClosedRange<Int>) -> SubSequence {
        return prefix(range.lowerBound + range.count).suffix(range.count)
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
        XCTAssertEqual(s.longestSubstring("aaabb", 3), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.longestSubstring("ababbc", 2), 5)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.longestSubstring("", 0), 0)
    }
}

Tests.defaultTestSuite.run()
