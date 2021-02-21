import Foundation

// 860. Lemonade Change
// https://leetcode.com/problems/lemonade-change

// MARK: - Solution
// ================
class Solution {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0
        var ten = 0

        for bill in bills {
            if bill == 5 {
                five += 1
            } else if bill == 10 {
                guard five > 0 else { return false }
                five -= 1
                ten += 1
            } else {
                if five > 0 && ten > 0 {
                    five -= 1
                    ten -= 1
                } else if five >= 3 {
                    five -= 3
                } else {
                    return false
                }
            }
        }

        return true
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
        XCTAssertTrue(s.lemonadeChange([5, 5, 5, 10, 20]))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.lemonadeChange([5, 5, 10]))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s.lemonadeChange([10, 10]))
    }

    func testLeetCodeExample4() {
        XCTAssertFalse(s.lemonadeChange([5, 5, 10, 10, 20]))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.lemonadeChange([]))
    }
}

Tests.defaultTestSuite.run()
