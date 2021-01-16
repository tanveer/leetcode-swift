import Foundation

// 66. Plus One
// https://leetcode.com/problems/plus-one

// MARK: - Solution
// ================
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        for i in stride(from: digits.count - 1, to: -1, by: -1) {
            if digits[i] == 9 {
                result[i] = 0
            } else {
                result[i] += 1
                return result
            }
        }
        if result.first == 0 {
            result.insert(1, at: 0)
        }
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
        XCTAssertEqual(s.plusOne([1, 2, 3]), [1, 2, 4])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.plusOne([4, 3, 2, 1]), [4, 3, 2, 2])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.plusOne([0]), [1])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.plusOne([9, 9]), [1, 0, 0])
    }
}

Tests.defaultTestSuite.run()
