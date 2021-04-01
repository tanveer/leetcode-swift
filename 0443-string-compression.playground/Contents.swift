import Foundation

// 443. String Compression
// https://leetcode.com/problems/string-compression

// MARK: - Solution
// ================
class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        guard chars.count > 1 else { return 1 }
        var index = 0
        var i = 0
        var j = 0

        while i < chars.count {
            j = i
            while j < chars.count, chars[j] == chars[i] {
                j += 1
            }

            chars[index] = chars[i]
            index += 1

            if j - i > 1 {
                let count = String(j - i)
                for c in count {
                    chars[index] = c
                    index += 1
                }
            }

            i = j
        }
        return index
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
        var chars: [Character] = ["a", "a", "b", "b", "c", "c", "c"]
        XCTAssertEqual(s.compress(&chars), 6)
    }

    func testLeetCodeExample2() {
        var chars: [Character] = ["a"]
        XCTAssertEqual(s.compress(&chars), 1)
    }

    func testLeetCodeExample3() {
        var chars: [Character] = ["a", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b"]
        XCTAssertEqual(s.compress(&chars), 4)
    }

    func testLeetCodeExample4() {
        var chars: [Character] = ["a", "a", "a", "b", "b", "a", "a"]
        XCTAssertEqual(s.compress(&chars), 6)
    }
}

Tests.defaultTestSuite.run()
