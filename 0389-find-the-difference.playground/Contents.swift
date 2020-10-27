import Foundation

// 389. Find the Difference
// https://leetcode.com/problems/find-the-difference

// MARK: - Solution
// ================
class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character  {
        var charcters = [Character: Int]()

        for c in s {
            charcters[c, default: 0] += 1
        }

        for c in t {
            if let count = charcters[c], count != 0 {
                charcters[c] = count - 1
            } else {
                return c
            }
        }

        return " "
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
        XCTAssertEqual(s.findTheDifference("abcd", "abcde"), "e")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.findTheDifference("", "y"), "y")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.findTheDifference("a", "aa"), "a")
    }
    
    func testLeetCodeExample4() {
        XCTAssertEqual(s.findTheDifference("ae", "aea"), "a")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findTheDifference("", ""), " ")
    }
}

Tests.defaultTestSuite.run()
