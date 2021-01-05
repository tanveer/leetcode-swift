import Foundation

// 7. Reverse Integer
// https://leetcode.com/problems/reverse-integer

// MARK: - Solution
// ================
class Solution {
    func reverse(_ x: Int) -> Int {
        var original = x
        var output: Int = 0
        
        while original != 0 {
            let pop = original % 10
            original /= 10
            output = output * 10 + pop
            if (output > Int32.max || output < Int32.min) { return 0 }
        }
        
        return output
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
        XCTAssertEqual(s.reverse(123), 321)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.reverse(-123), -321)
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.reverse(120), 21)
    }
    
    func testLeetCodeExample4() {
        XCTAssertEqual(s.reverse(0), 0)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.reverse(11111), 11111)
    }
}

Tests.defaultTestSuite.run()
