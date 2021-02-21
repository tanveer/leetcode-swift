import Foundation

// 824. Goat Latin
// https://leetcode.com/problems/goat-latin

// MARK: - Solution
// ================
class Solution {
    func toGoatLatin(_ S: String) -> String {
        let vowels = Set<Character>(arrayLiteral: "a", "e", "i", "o", "u")
        var result = ""
        var suffix = ""

        for word in S.split(separator: " ") {
            var chars = Array(word)
            suffix += "a"
            let lowercasedChar = Character(chars[0].lowercased())
            if !vowels.contains(lowercasedChar) {
                let char = chars[0]
                chars = Array(chars.dropFirst())
                chars.append(char)
            }
            result += chars.map { String($0) }.joined() + "ma" + suffix + " "
        }

        return String(result.dropLast())
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
        XCTAssertEqual(s.toGoatLatin("I speak Goat Latin"), "Imaa peaksmaaa oatGmaaaa atinLmaaaaa")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.toGoatLatin("The quick brown fox jumped over the lazy dog"), "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.toGoatLatin(""), "")
    }
}

Tests.defaultTestSuite.run()
