import Foundation

// 925. Long Pressed Name
// https://leetcode.com/problems/long-pressed-name

// MARK: - Solution
// ================
class Solution {
    func isLongPressedName(_ name: String, _ typed: String) -> Bool {
        let nameChars = [Character](name)

        var i = 0
        for char in typed {
            if i < name.count, char == nameChars[i] {
                i += 1
            } else {
                if i == 0 || char != nameChars[i - 1] {
                    return false
                }
            }
        }

        return i == name.count
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
        XCTAssertTrue(s.isLongPressedName("alex", "aaleex"))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.isLongPressedName("saeed", "ssaaedd"))
    }

    func testLeetCodeExample3() {
        XCTAssertTrue(s.isLongPressedName("leelee", "lleeelee"))
    }

    func testLeetCodeExample4() {
        XCTAssertTrue(s.isLongPressedName("laiden", "laiden"))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.isLongPressedName("", ""))
    }
}

Tests.defaultTestSuite.run()
