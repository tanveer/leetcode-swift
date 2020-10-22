import Foundation

// 344. Reverse String
// https://leetcode.com/problems/reverse-string

// MARK: - Solution
// ================
class Solution {
    func reverseString(_ s: inout [Character]) {
        var left = 0
        var right = s.count - 1

        while left < right {
            let char = s[left]
            s[left] = s[right]
            s[right] = char
            left += 1
            right -= 1
        }
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
        var inoutInput: [Character] = ["h", "e", "l", "l", "o"]
        s.reverseString(&inoutInput)
        XCTAssertEqual(inoutInput, ["o", "l", "l", "e", "h"])
    }

    func testLeetCodeExample2() {
        var inoutInput: [Character] = ["H", "a", "n", "n", "a", "h"]
        s.reverseString(&inoutInput)
        XCTAssertEqual(inoutInput, ["h", "a", "n", "n", "a", "H"])
    }

    // Additional Examples
    func testAdditionalExamples() {
        var inoutInput: [Character] = []
        s.reverseString(&inoutInput)
        XCTAssertEqual(inoutInput, [])
    }
}

Tests.defaultTestSuite.run()
