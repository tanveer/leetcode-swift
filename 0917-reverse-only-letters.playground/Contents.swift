import Foundation

// 917. Reverse Only Letters
// https://leetcode.com/problems/reverse-only-letters

// MARK: - Solution
// ================
class Solution1 {
    func reverseOnlyLetters(_ S: String) -> String {
        let chars = [Character](S)
        var reversed = [Character]()
        var rightIndex = S.count - 1

        for char in S {
            if char.isLetter {
                while !chars[rightIndex].isLetter {
                    rightIndex -= 1
                }
                reversed.append(chars[rightIndex])
                rightIndex -= 1
            } else {
                reversed.append(char)
            }
        }
        return String(reversed)
    }
}

class Solution2 {
    func reverseOnlyLetters(_ S: String) -> String {
        var chars: [Character] = S.filter { $0.isLetter }
        var reversed = [Character]()

        for char in S {
            if char.isLetter {
                reversed.append(chars.removeLast())
            } else {
                reversed.append(char)
            }
        }

        return reversed.compactMap { String($0) }.joined()
    }
}

class Solution3 {
    func reverseOnlyLetters(_ S: String) -> String {
        var chars = [Character](S)
        var left = 0
        var right = S.count - 1

        while left < right {
            if chars[left].isLetter && chars[right].isLetter {
                chars.swapAt(left, right)
                left += 1
                right -= 1
            } else if !chars[left].isLetter {
                left += 1
            } else {
                right -= 1
            }
        }
        return String(chars)
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
    let s1 = Solution1()
    let s2 = Solution2()
    let s3 = Solution3()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.reverseOnlyLetters("ab-cd"), "dc-ba")
        XCTAssertEqual(s2.reverseOnlyLetters("ab-cd"), "dc-ba")
        XCTAssertEqual(s3.reverseOnlyLetters("ab-cd"), "dc-ba")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.reverseOnlyLetters("a-bC-dEf-ghIj"), "j-Ih-gfE-dCba")
        XCTAssertEqual(s2.reverseOnlyLetters("a-bC-dEf-ghIj"), "j-Ih-gfE-dCba")
        XCTAssertEqual(s3.reverseOnlyLetters("a-bC-dEf-ghIj"), "j-Ih-gfE-dCba")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s1.reverseOnlyLetters("Test1ng-Leet=code-Q!"), "Qedo1ct-eeLg=ntse-T!")
        XCTAssertEqual(s2.reverseOnlyLetters("Test1ng-Leet=code-Q!"), "Qedo1ct-eeLg=ntse-T!")
        XCTAssertEqual(s3.reverseOnlyLetters("Test1ng-Leet=code-Q!"), "Qedo1ct-eeLg=ntse-T!")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.reverseOnlyLetters(""), "")
        XCTAssertEqual(s2.reverseOnlyLetters(""), "")
        XCTAssertEqual(s3.reverseOnlyLetters(""), "")
    }
}

Tests.defaultTestSuite.run()
