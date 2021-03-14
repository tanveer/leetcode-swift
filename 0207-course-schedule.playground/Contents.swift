import Foundation

// 207. Course Schedule
// https://leetcode.com/problems/course-schedule

// MARK: - Solution
// ================
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        var preCourses = [Int: [Int]]()

        for relation in prerequisites {
            preCourses[relation[0], default: []].append(relation[1])
        }

        var isVisited = [Int: Bool]()
        for course in preCourses.keys {
            guard dfs(preCourses, course, &isVisited) else { return false }
        }
        return true
    }

    func dfs(_ preCourses: [Int: [Int]], _ course: Int, _ isVisited: inout [Int: Bool]) -> Bool {
        if let fullyVisited = isVisited[course] {
            return fullyVisited
        }

        isVisited[course] = false

        for preCourse in preCourses[course] ?? [] {
            guard dfs(preCourses, preCourse, &isVisited) else { return false }
        }

        isVisited[course] = true
        return true
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n^2)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.canFinish(2, [[1, 0]]))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.canFinish(2, [[1, 0], [0, 1]]))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.canFinish(1, [[0, 0]]))
    }
}

Tests.defaultTestSuite.run()
