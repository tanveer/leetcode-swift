import Foundation

// 1450. Number of Students Doing Homework at a Given Time
// https://leetcode.com/problems/number-of-students-doing-homework-at-a-given-time

// MARK: - Solution
// ================
class Solution {
    func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
        guard !startTime.isEmpty else { return 0 }

        var numberOfBusyStudents = 0
        for (index, element) in startTime.enumerated() {
            numberOfBusyStudents += (element...endTime[index]).contains(queryTime) ? 1 : 0
        }

        return numberOfBusyStudents
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
        XCTAssertEqual(s.busyStudent([1, 2, 3], [3, 2, 7], 4), 1)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.busyStudent([4], [4], 4), 1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.busyStudent([4], [4], 5), 0)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s.busyStudent([1, 1, 1, 1], [1, 3, 2, 4], 7), 0)
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.busyStudent([9, 8, 7, 6, 5, 4, 3, 2, 1], [10, 10, 10, 10, 10, 10, 10, 10, 10], 5), 5)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.busyStudent([], [], 0), 0)
    }
}

Tests.defaultTestSuite.run()
