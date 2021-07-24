import Foundation

// 340. Longest Substring with At Most K Distinct Characters
// https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters

// MARK: - Solution
// ================
class Solution {
    func lengthOfLongestSubstringKDistinct(_ s: String, _ k: Int) -> Int {
        guard !s.isEmpty else { return 0 }
        let chars = [Character](s)
        var maxCount = 0
        var start = 0
        var map = [Character: Int]()

        for index in 0..<chars.count {
            let char = chars[index]
            if !map.keys.contains(char) {
                map[char] = 0
            }
            map[char]! += 1

            while map.count > k {
                let leftChar = chars[start]
                map[leftChar]! -= 1
                if map[leftChar] == 0 {
                    map[leftChar] = nil
                }
                start += 1
            }
            maxCount = max(maxCount, index - start + 1)
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
        XCTAssertEqual(s.lengthOfLongestSubstringKDistinct("eceba", 2), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.lengthOfLongestSubstringKDistinct("aa", 1), 2)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.lengthOfLongestSubstringKDistinct("", 0), 0)
    }
}

Tests.defaultTestSuite.run()
