import Foundation

// 509. Fibonacci Number
// https://leetcode.com/problems/fibonacci-number
// MARK: - Solution
// ================
class Solution {
    func fib(_ N: Int) -> Int {
        guard N > 1 else { return N }
        if N == 2 { return 1 }
        
        var ans = 0
        var a = 1
        var b = 1
        
        for _ in 3...N {
            ans = a + b
            b = a
            a = ans
        }
        
        return ans
    }
    
    // Recursive solution very slow
    func fibRecursive(_ n: Int) -> Int {
        if n <= 1 { return n }
        return fibRecursive(n-1) + fibRecursive(n-2)
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
        XCTAssertEqual(s.fib(2), 1)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.fib(3), 2)
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.fib(4), 3)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.fib(0), 0)
        XCTAssertEqual(s.fib(92), 7_540_113_804_746_346_429) // 93 overflows since Int.max == 9_223_372_036_854_775_807
    }
}

Tests.defaultTestSuite.run()
