import Foundation

// 451. Sort Characters By Frequency
// https://leetcode.com/problems/sort-characters-by-frequency

// MARK: - Solution
// ================
class Solution {
    func frequencySort(_ s: String) -> String {
        let charCount = s.reduce(into: [:]) { dict, char in
            dict[char, default: 0] += 1
        }
        .sorted {
            $0.value > $1.value
        }

        var output = ""
        for (char, count) in charCount {
            let str = String(repeating: "\(char)", count: count)
            output.append(str)
        }

        return output
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(nlog(n))
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.frequencySort("tree"), "eert")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.frequencySort("cccaaa"), "cccaaa")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.frequencySort("Aabb"), "bbAa")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.frequencySort(""), "")
    }
}

Tests.defaultTestSuite.run()
