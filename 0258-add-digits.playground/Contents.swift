import Foundation

// 258. Add Digits
// https://leetcode.com/problems/add-digits

// MARK: - Solution
// ================
class Solution {
    func addDigits(_ num: Int) -> Int {
        var digit = 0
        var num = num

        while num > 0 {
            digit += num % 10
            num /= 10
            if num == 0 && digit > 9 {
                num = digit
                digit = 0
            }
        }
        return digit
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(0)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample() {
        XCTAssertEqual(s.addDigits(38), 2 )
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.addDigits(0), 0 )
    }
}

Tests.defaultTestSuite.run()
