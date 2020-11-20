import Foundation

// 485. Max Consecutive Ones
// https://leetcode.com/problems/max-consecutive-ones

// MARK: - Solution
// ================
class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxOnes = 0
        var count = 0
        
        for num in nums {
            count += num == 1 ? 1 : 0
            maxOnes = max(maxOnes, count)
            count = num == 0 ? 0 : count
        }
        
        return maxOnes
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
        XCTAssertEqual(s.findMaxConsecutiveOnes([1, 1, 0, 1, 1, 1]), 3)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findMaxConsecutiveOnes([]), 0)
    }
}

Tests.defaultTestSuite.run()

