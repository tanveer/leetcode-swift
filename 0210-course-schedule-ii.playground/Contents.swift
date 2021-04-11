import Foundation

// 210. Course Schedule II
// https://leetcode.com/problems/course-schedule-ii

// MARK: - Solution
// ================
class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var adjacencyList = [[Int]](repeating: [], count: numCourses)
        for courses in prerequisites {
            adjacencyList[courses[1]].append(courses[0])
        }

        var stack = [Int]()
        var visited = [Int](repeating: 0, count: numCourses)
        for num in 0..<numCourses {
            if visited[num] == 0, dfs(num, &adjacencyList, &stack, &visited) {
                return []
            }
        }

        var result = [Int]()
        while !stack.isEmpty {
            let last = stack.removeLast()
            result.append(last)
        }

        // can also be return stack.reversed()
        return result
    }

    func dfs(_ i: Int, _ adjacencyList: inout [[Int]], _ stack: inout [Int], _ visited: inout [Int]) -> Bool {
        visited[i] = 1
        for v in adjacencyList[i] {
            if visited[v] == 1 {
                return true
            }
            if visited[v] == 0, dfs(v, &adjacencyList, &stack, &visited) {
                return true
            }
        }
        visited[i] = 2
        stack.append(i)
        return false
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(?)
// Space Complexity: O(?)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.findOrder(2, [[1, 0]]), [0, 1])
    }

    func testLeetCodeExample2() {
        let order = s.findOrder(4, [[1, 0], [2, 0], [3, 1], [3, 2]])
        XCTAssertTrue(order == [0, 2, 1, 3] || order == [0, 1, 2, 3])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.findOrder(1, []), [0])
    }
}

Tests.defaultTestSuite.run()
