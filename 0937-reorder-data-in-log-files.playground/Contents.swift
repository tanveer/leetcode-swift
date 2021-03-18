import Foundation

// 937. Reorder Data in Log Files
// https://leetcode.com/problems/reorder-data-in-log-files

// MARK: - Solution
// ================
class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        guard !logs.isEmpty else { return [] }

        var orderedDigits = [String]()
        var orderedLetters = [String]()
        var letters = [(key: String, value: String)]()

        for log in logs {
            guard let spaceIndex = log.firstIndex(of: " ") else { fatalError() }
            let startValueIndex = log.index(after: spaceIndex)
            let key = String(log[..<spaceIndex])
            let value = String(log[startValueIndex...])

            if value.first!.isLetter {
                letters.append((key, value))
            } else {
                orderedDigits.append(log)
            }
        }

        // only letter-logs's values(ignore id) need to be ordered lexicographically
        letters.sort { $0.value <= $1.value }

        for letter in letters {
            orderedLetters.append(letter.key + " " + letter.value)
        }

        return orderedLetters + orderedDigits
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
        let input = ["dig1 8 1 5 1", "let1 art can", "dig2 3 6", "let2 own kit dig", "let3 art zero"]
        let output = ["let1 art can", "let3 art zero", "let2 own kit dig", "dig1 8 1 5 1", "dig2 3 6"]
        XCTAssertEqual(s.reorderLogFiles(input), output)
    }

    func testLeetCodeExample2() {
        let input = ["a1 9 2 3 1", "g1 act car", "zo4 4 7", "ab1 off key dog", "a8 act zoo"]
        let output = ["g1 act car", "a8 act zoo", "ab1 off key dog", "a1 9 2 3 1", "zo4 4 7"]
        XCTAssertEqual(s.reorderLogFiles(input), output)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.reorderLogFiles([]), [])
    }
}

Tests.defaultTestSuite.run()
