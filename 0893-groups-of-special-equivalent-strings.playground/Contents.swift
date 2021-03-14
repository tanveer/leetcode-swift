import Foundation

// 893. Groups of Special-Equivalent Strings
// https://leetcode.com/problems/groups-of-special-equivalent-strings

// MARK: - Solution
// ================
class Solution {
    func numSpecialEquivGroups(_ A: [String]) -> Int {
        var seen = Set<String>()

        for word in A {
            let chars = Array(word)
            var counts = [Int](repeating: 0, count: 52)
            for i in 0..<word.count {
                counts[Int(chars[i].asciiValue! - Character("a").asciiValue!) + 26 * (i % 2)] += 1
            }
            seen.insert(counts.map { String($0) }.joined())
        }
        return seen.count
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
        XCTAssertEqual(s.numSpecialEquivGroups(["abcd", "cdab", "cbad", "xyzz", "zzxy", "zzyx"]), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.numSpecialEquivGroups(["abc", "acb", "bac", "bca", "cab", "cba"]), 3)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.numSpecialEquivGroups([]), 0)
    }
}

Tests.defaultTestSuite.run()
