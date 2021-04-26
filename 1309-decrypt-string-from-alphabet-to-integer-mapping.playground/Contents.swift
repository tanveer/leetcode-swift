import Foundation

// 1309. Decrypt String from Alphabet to Integer Mapping
// https://leetcode.com/problems/decrypt-string-from-alphabet-to-integer-mapping

// MARK: - Solution
// ================
class Solution {
    let alphabetMap = [
        "1": "a",
        "2": "b",
        "3": "c",
        "4": "d",
        "5": "e",
        "6": "f",
        "7": "g",
        "8": "h",
        "9": "i",
        "10#": "j",
        "11#": "k",
        "12#": "l",
        "13#": "m",
        "14#": "n",
        "15#": "o",
        "16#": "p",
        "17#": "q",
        "18#": "r",
        "19#": "s",
        "20#": "t",
        "21#": "u",
        "22#": "v",
        "23#": "w",
        "24#": "x",
        "25#": "y",
        "26#": "z",
    ]

    func freqAlphabets(_ s: String) -> String {
        guard !s.isEmpty else { return "" }

        var output = ""
        var index = 0
        let chars = Array(s)

        while index < chars.count {
            if (index + 2) < chars.count, chars[index + 2] == "#" {
                let key = String(chars[index...index + 2])
                let alphabet = alphabetMap[key] ?? ""
                output.append(alphabet)
                index += 3
            } else {
                let key = String(chars[index])
                let alphabet = alphabetMap[key] ?? ""
                output.append(alphabet)
                index += 1
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
        XCTAssertEqual(s.freqAlphabets("10#11#12"), "jkab")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.freqAlphabets("1326#"), "acz")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.freqAlphabets("25#"), "y")
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.freqAlphabets("12345678910#11#12#13#14#15#16#17#18#19#20#21#22#23#24#25#26#"), "abcdefghijklmnopqrstuvwxyz")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.freqAlphabets(""), "")
    }
}

Tests.defaultTestSuite.run()
