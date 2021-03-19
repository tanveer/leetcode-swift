import Foundation

// 841. Keys and Rooms
// https://leetcode.com/problems/keys-and-rooms

// MARK: - Solution
// ================
class Solution1 {
    var visited: [Bool] = []

    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        visited = [Bool](repeating: false, count: rooms.count)
        visited[0] = true

        dfs(rooms, 0)
        for visit in visited where !visit {
            return false
        }

        return true
    }

    func  dfs(_ rooms: [[Int]], _ index: Int) {
        for key in rooms[index] where !visited[key] {
            visited[key] = true
            dfs(rooms, key)
        }
    }
}

class Solution2 {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited = [Bool](repeating: false, count: rooms.count)
        visited[0] = true
        var stack = [Int]()
        stack.append(0)

        while !stack.isEmpty {
            let key = stack.removeLast()
            for room in rooms[key] where !visited[room] {
                visited[room] = true
                stack.append(room)
            }
        }

        for visit in visited where !visit {
            return false
        }
        return true
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n + e) // Room + Key
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s1.canVisitAllRooms([[1], [2], [3], []]))
        XCTAssertTrue(s2.canVisitAllRooms([[1], [2], [3], []]))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s1.canVisitAllRooms([[1, 3], [3, 0, 1], [2], [0]]))
        XCTAssertFalse(s2.canVisitAllRooms([[1, 3], [3, 0, 1], [2], [0]]))
    }
}

Tests.defaultTestSuite.run()
