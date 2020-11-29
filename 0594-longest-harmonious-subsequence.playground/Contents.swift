import Foundation

// 594. Longest Harmonious Subsequence
// https://leetcode.com/problems/longest-harmonious-subsequence

// MARK: - Solution
// ================
class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        let map = nums.reduce(into: [:]){ dict, num in
            dict[num, default: 0] += 1
        }
        
        var res = 0
        for k in map.keys {
            if map[k+1] != nil {
                res = max(res, map[k]! + map[k + 1]!)
            }
        }
        
        return res
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.findLHS([1, 3, 2, 2, 5, 2, 3, 7]), 5)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.findLHS([1, 2, 3, 4]), 2)
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.findLHS([1, 1, 1, 1]), 0)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findLHS([]), 0)
    }
}

Tests.defaultTestSuite.run()

