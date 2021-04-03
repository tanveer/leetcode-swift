import Foundation

// 345. Reverse Vowels of a String
// https://leetcode.com/problems/reverse-vowels-of-a-string

// MARK: - Solution
// ================
class Solution {
    func reverseVowels(_ s: String) -> String {
        guard s.count > 1 else { return s }
        var chars = [Character](s)
        var left = 0
        var right = chars.count - 1

        // keep checking until left == right
        while left < right {
            if isVowel(chars[left]), isVowel(chars[right]) {
                chars.swapAt(left, right) // swap vowel
                // increament and decrement pointer
                left += 1
                right -= 1
            } else {
                if !isVowel(chars[left]) {
                    left += 1
                }

                if !isVowel(chars[right]) {
                    right -= 1
                }
            }
        }
        return String(chars)
    }

    func isVowel(_ char: Character) -> Bool {
        let vowels = Set<Character>(["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"])
        return vowels.contains(char)
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(n) this could be O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.reverseVowels("hello"), "holle")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.reverseVowels("leetcode"), "leotcede")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.reverseVowels(""), "")
    }
}

Tests.defaultTestSuite.run()
