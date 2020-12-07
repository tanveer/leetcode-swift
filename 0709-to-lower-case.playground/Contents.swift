import Foundation

// 709. To Lower Case
// https://leetcode.com/problems/to-lower-case

// MARK: - Solution
// ================
class Solution {
    func toLowerCase(_ str: String) -> String {

        var result = [Character]()
        let upperCaseChars = CharacterSet.uppercaseLetters

        for c in str {
            let val =  c.asciiValue ?? 0
            if upperCaseChars.contains(UnicodeScalar(val)) {
                if val >= 65 && val <= 97 {
                    result.append(Character(UnicodeScalar(val + 32)))
                }
            } else {
                result.append(c)
            }
        }

        return result.map{ String($0) }.joined()
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
        XCTAssertEqual(s.toLowerCase("Hello"), "hello")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.toLowerCase("here"), "here")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.toLowerCase("LOVELY"), "lovely")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.toLowerCase(""), "")
    }
}

Tests.defaultTestSuite.run()
