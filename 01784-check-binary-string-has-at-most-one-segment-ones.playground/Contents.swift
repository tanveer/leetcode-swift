import Cocoa

// 1784. Check if Binary String Has at Most One Segment of Ones
// https://leetcode.com/problems/check-if-binary-string-has-at-most-one-segment-of-ones/

// MARK: - Solution
// ================
class Solution1 {
    func checkOnesSegment(_ s: String) -> Bool {
        return !s.contains("01")
    }
}

class Solution2 {
    func checkOnesSegment(_ s: String) -> Bool {
        var isZero = false
        
        for char in s {
            if char == "1" {
                if isZero {
                    return false
                }
            } else {
                isZero = true
            }
        }
        
        return isZero
    }
}


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        XCTAssertFalse(s1.checkOnesSegment("1001"))
        XCTAssertTrue(s1.checkOnesSegment("110"))
    }
    
    // Additional Examples
    func testLeetCodeExampleCall1() {
        XCTAssertFalse(s2.checkOnesSegment("1001"))
        XCTAssertTrue(s2.checkOnesSegment("110"))
    }
}

Tests.defaultTestSuite.run()
