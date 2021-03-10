import Foundation

// 12. Integer to Roman
// https://leetcode.com/problems/integer-to-roman

// MARK: - Solution
// ================
class Solution1 {
    func intToRoman(_ num: Int) -> String {
        var romanLetters = ""

        let romanLettersMap: KeyValuePairs = [
            1000: "M",
            900: "CM",
            500: "D",
            400: "CD",
            100: "C",
            90: "XC",
            50: "L",
            40: "XL",
            10: "X",
            9: "IX",
            5: "V",
            4: "IV",
            1: "I",
        ]

        var original = num
        for (val, romanLetter) in romanLettersMap {
            while original >= val {
                original -= val
                romanLetters += romanLetter
            }
        }

        return romanLetters
    }
}

class Solution2 {
    func intToRoman(_ num: Int) -> String {
        guard num > 0 else { return "" }

        let M = ["", "M", "MM", "MMM"]
        let C = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
        let X = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
        let I = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

        let thousands = M[num / 1000]
        let hundereds = C[(num % 1000) / 100]
        let tens =  X[(num % 100) / 10]
        let ones = I[num % 10]

        return "\(thousands)\(hundereds)\(tens)\(ones)"
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
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.intToRoman(3), "III")
        XCTAssertEqual(s2.intToRoman(3), "III")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.intToRoman(4), "IV")
        XCTAssertEqual(s2.intToRoman(4), "IV")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s1.intToRoman(9), "IX")
        XCTAssertEqual(s2.intToRoman(9), "IX")
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s1.intToRoman(58), "LVIII")
        XCTAssertEqual(s2.intToRoman(58), "LVIII")
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s1.intToRoman(1994), "MCMXCIV")
        XCTAssertEqual(s2.intToRoman(1994), "MCMXCIV")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.intToRoman(0), "")
        XCTAssertEqual(s2.intToRoman(0), "")
    }
}

Tests.defaultTestSuite.run()
