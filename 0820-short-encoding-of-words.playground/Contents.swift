import Foundation

// 820. Short Encoding of Words
// https://leetcode.com/problems/short-encoding-of-words

// MARK: - Solution
// ================
class Solution {
    func minimumLengthEncoding(_ words: [String]) -> Int {
        var wordSet = Set<String>(words)

        for word in words {
            let chars = Array(word)
            for i in 1..<chars.count {
                wordSet.remove(String(chars[i...]))
            }
        }

        var result = 0
        for word in wordSet {
            result += word.count + 1
        }
        return result
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(W^2)
// Space Complexity: O(W)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample() {
        XCTAssertEqual(s.minimumLengthEncoding(["time", "me", "bell"]), 10)
    }

    func testLeetCodeExample1() {
        XCTAssertEqual(s.minimumLengthEncoding(["feipyxx", "e"]), 10)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.minimumLengthEncoding(["time", "atime", "btime"]), 12)
    }
}

Tests.defaultTestSuite.run()
