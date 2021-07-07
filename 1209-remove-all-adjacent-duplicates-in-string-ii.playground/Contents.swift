import Foundation

// 1209. Remove All Adjacent Duplicates in String II
// https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string-ii

// MARK: - Solution
// ================
class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        guard !s.isEmpty else { return "" }
        var stack = [(char: Character, freq: Int)]()
        var count = 0

        for char in s {
            if stack.isEmpty || stack.last?.char != char {
                stack.append((char, 1))
                count += 1
            } else {
                stack[count - 1].freq += 1
                if stack[count - 1].freq == k {
                    stack.removeLast()
                    count -= 1
                }
            }
        }

        var result = ""

        for (char, freq) in stack {
            result += String(repeating: char, count: freq)
        }
        return result
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
        XCTAssertEqual(s.removeDuplicates("abcd", 2), "abcd")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.removeDuplicates("deeedbbcccbdaa", 3), "aa")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.removeDuplicates("pbbcggttciiippooaais", 2), "ps")
    }
}

Tests.defaultTestSuite.run()
