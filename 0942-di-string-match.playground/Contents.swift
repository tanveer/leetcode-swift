import Foundation

// 942. DI String Match
// https://leetcode.com/problems/di-string-match

// MARK: - Solution
// ================
class Solution {
    func diStringMatch(_ S: String) -> [Int] {
        var low = 0
        var high = S.count
        var result = [Int]()

        for char in S {
            if char == "I" {
                result.append(low)
                low += 1
            } else {
                result.append(high)
                high -= 1
            }
        }
        result.append(low)

        return result
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
        XCTAssertEqual(s.diStringMatch("IDID"), [0, 4, 1, 3, 2])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.diStringMatch("III"), [0, 1, 2, 3])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.diStringMatch("DDI"), [3, 2, 0, 1])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.diStringMatch("I"), [0, 1])
        XCTAssertEqual(s.diStringMatch("D"), [1, 0])
    }
}

Tests.defaultTestSuite.run()
