import Foundation

// 246. Strobogrammatic Number
// https://leetcode.com/problems/strobogrammatic-number

// MARK: - Solution
// ================
class Solution {
    func isStrobogrammatic(_ num: String) -> Bool {
        var rotated = ""
        for numCharacter in num.reversed() {
            switch numCharacter {
            case "0", "1", "8":
                rotated.append(numCharacter)
            case "6":
                rotated.append("9")
            case "9":
                rotated.append("6")
            default:
                return false
            }
        }
        return rotated == num
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
        XCTAssertTrue(s.isStrobogrammatic("69"))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.isStrobogrammatic("88"))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s.isStrobogrammatic("962"))
    }

    func testLeetCodeExample4() {
        XCTAssertTrue(s.isStrobogrammatic("99866"))
    }

    func testLeetCodeExample5() {
        XCTAssertTrue(s.isStrobogrammatic("1"))
    }
}

Tests.defaultTestSuite.run()
