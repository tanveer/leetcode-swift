import Foundation

// 728. Self Dividing Numbers
// https://leetcode.com/problems/self-dividing-numbers

// MARK: - Solution
// ================
class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        guard left > 0 else { return [] }
        
        return (left...right).filter{ isSelfDividing($0) }
    }
    
    func isSelfDividing(_ n: Int) -> Bool {
        var number = n
        
        while number > 0 {
            let digit = number % 10
            if digit > 0, n % digit == 0 {
                number /= 10
            } else {
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
        XCTAssertEqual(s.selfDividingNumbers(1, 22), [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.selfDividingNumbers(0, 0), [])
    }
}

Tests.defaultTestSuite.run()

