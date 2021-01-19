import Foundation

// 17. Letter Combinations of a Phone Number
// https://leetcode.com/problems/letter-combinations-of-a-phone-number

// MARK: - Solution
// ================
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [String]() }
        let charsMap: [Character: [String]] = [
            "2": ["a", "b", "c"],
            "3": ["d", "e", "f"],
            "4": ["g", "h", "i"],
            "5": ["j", "k", "l"],
            "6": ["m", "n", "o"],
            "7": ["p", "q", "r", "s"],
            "8": ["t", "u", "v"],
            "9": ["w", "x", "y", "z"],
        ]

        var res = [""]
        for digit in digits {
            var temp = [String]()
            for char in charsMap[digit, default: [String]()] {
                temp.append(contentsOf: res.map { $0 + char })
            }
            res = temp
        }
        return res
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(3^n x 4^m) not sure if this is correct
// Space Complexity: O(3^n x 4^m) not sure if this is correct

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.letterCombinations("23"), ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.letterCombinations(""), [])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.letterCombinations("2"), ["a", "b", "c"])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.letterCombinations("456"), ["TODO: Fill in actual answer"])
    }
}

Tests.defaultTestSuite.run()
