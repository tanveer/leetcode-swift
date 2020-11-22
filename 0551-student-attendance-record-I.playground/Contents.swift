import Foundation

// 551. Student Attendance Record I
// https://leetcode.com/problems/student-attendance-record-i

// MARK: - Solution
// ================
class Solution {
    func checkRecord(_ s: String) -> Bool {
        guard !s.isEmpty else { return false }
        
        var absent = 0
        var late = 0
        
        for char in s {
            if char == "A" {
                absent += 1
            }
            if absent >= 2 {
                return false
            }
            
            late = char == "L" ? late + 1 : 0
            if late >= 3 {
                return false
            }
        }
        
        return true
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
        XCTAssertTrue(s.checkRecord("PPALLP"))
    }
    
    func testLeetCodeExample2() {
        XCTAssertFalse(s.checkRecord("PPALLL"))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.checkRecord(""))
    }
}

Tests.defaultTestSuite.run()
