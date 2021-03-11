import Foundation

// 874. Walking Robot Simulation
// https://leetcode.com/problems/walking-robot-simulation

// MARK: - Solution
// ================
class Solution {
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        let dx = [0, 1, 0, -1]
        let dy = [1, 0, -1, 0]
        var x = 0, y = 0, di = 0

        let obstacleSet = Set<String>(obstacles.map { "\($0[0])#\($0[1])" })

        var totalMoves = 0
        for cmd in commands {
            if cmd == -2 {  // left
                di = (di + 3) % 4
            } else if cmd == -1 {  // right
                di = (di + 1) % 4
            } else {
                for _ in 0..<cmd {
                    let nx = x + dx[di]
                    let ny = y + dy[di]
                    let code = "\(nx)#\(ny)"

                    if !obstacleSet.contains(code) {
                        x = nx
                        y = ny
                        totalMoves = max(totalMoves, x * x + y * y)
                    }
                }
            }
        }

        return totalMoves
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n + k) where N,K are the lengths of commands and obstacles respectively.
// Space Complexity: O(k) the space used in storing the obstacleSet.

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.robotSim([4, -1, 3], []), 25)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.robotSim([4, -1, 4, -2, 4], [[2, 4]]), 65)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.robotSim([], []), 0)
    }
}

Tests.defaultTestSuite.run()
