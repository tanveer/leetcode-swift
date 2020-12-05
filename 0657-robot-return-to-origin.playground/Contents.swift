import Foundation

// 657. Robot Return to Origin
// https://leetcode.com/problems/robot-return-to-origin

// MARK: - Solution
// ================
class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        guard !moves.isEmpty else { return false }
        
        let ans = moves.reduce(into: (0,0)) {
            switch $1 {
            case "R": $0.0 += 1
            case "L": $0.0 += -1
            case "U": $0.1 += 1
            case "D": $0.1 += -1
            default:
                break
            }
        }
        
        return ans == (0,0)
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
        XCTAssertTrue(s.judgeCircle("UD"))
    }
    
    func testLeetCodeExample2() {
        XCTAssertFalse(s.judgeCircle("LL"))
    }
    
    func testLeetCodeExample3() {
        XCTAssertFalse(s.judgeCircle("RRDD"))
    }
    
    func testLeetCodeExample4() {
        XCTAssertFalse(s.judgeCircle("LDRRLRUULR"))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.judgeCircle(""))
    }
}

Tests.defaultTestSuite.run()

