import Foundation

// 682. Baseball Game
// https://leetcode.com/problems/baseball-game

// MARK: - Solution
// ================
class Solution {
    func calPoints(_ ops: [String]) -> Int {
        var record = [Int]()
        
        for op in ops {
            if op == "+" {
                record.append(record[record.count - 1] + record[record.count - 2])
            } else if op == "C" {
                record.removeLast()
            } else if op == "D" {
                let lastScore = record.last ?? 0
                record.append(lastScore * 2)
            } else {
                let score = Int(op) ?? 0
                record.append(score)
            }
        }
        
        return record.reduce(0, +)
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(__REPLACE_ME__)
// Space Complexity: O(__REPLACE_ME__)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.calPoints(["5", "2", "C", "D", "+"]), 30)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.calPoints(["5", "-2", "4", "C", "D", "9", "+", "+"]), 27)
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.calPoints(["1"]), 1)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.calPoints([]), 0)
    }
}

Tests.defaultTestSuite.run()

