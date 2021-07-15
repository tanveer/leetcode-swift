import Foundation

// 1086. High Five
// https://leetcode.com/problems/high-five

// MARK: - Solution
// ================
class Solution {
    func highFive(_ items: [[Int]]) -> [[Int]] {
        guard !items.isEmpty else { return [] }
        var students = [Int: [Int]]()
        let average = 5

        for item in items {
            let (id, score) = (item[0], item[1])
            if students[id] == nil {
                students[id] = [score]
            } else {
                students[id]?.append(score)
            }
        }

        let ids = students.keys

        var output = [[Int]]()
        var sum = 0

        for id in ids.sorted(by: <) {
            sum = 0
            if let scores = students[id]?.sorted(by: >) {
                for score in 0..<average {
                    sum += scores[score]
                }
            }
            output.append([id, sum / average])
        }

        return output
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(nlogn) // because of for sorting
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.highFive([[1, 91], [1, 92], [2, 93], [2, 97], [1, 60], [2, 77], [1, 65], [1, 87], [1, 100], [2, 100], [2, 76]]), [[1, 87], [2, 88]])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.highFive([[1, 100], [7, 100], [1, 100], [7, 100], [1, 100], [7, 100], [1, 100], [7, 100], [1, 100], [7, 100]]), [[1, 100], [7, 100]])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.highFive([]), [])
    }
}

Tests.defaultTestSuite.run()
