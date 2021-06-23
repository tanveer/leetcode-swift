import Foundation

// 13. Roman to Integer
// https://leetcode.com/problems/roman-to-integer

// MARK: - Solution
// ================
class Solution {
    func romanToInt(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }

        var output = 0
        let chars = [Character](s.uppercased())
        var previousValue = 0
        let values: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

        for char in chars {
            if let value = values[char] {
                if value > previousValue {
                    output += value - (previousValue * 2)
                } else {
                    output += value
                }
                previousValue = value
            }
        }
        return output
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
        XCTAssertEqual(s.romanToInt("III"), 3)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.romanToInt("IV"), 4)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.romanToInt("IX"), 9)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.romanToInt("LVIII"), 58)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.romanToInt("MCMXCIV"), 1994)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.romanToInt(""), 0)
    }
}

Tests.defaultTestSuite.run()
