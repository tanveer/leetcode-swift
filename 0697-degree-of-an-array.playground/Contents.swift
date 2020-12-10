
import Foundation

// 697. Degree of an Array
// https://leetcode.com/problems/degree-of-an-array

// MARK: - Solution
// ================
class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        var minCount = Int.max
        var degree = 0
        var firstSeen = [Int: Int]()
        var numsCount = [Int: Int]()
        
        for (i, num) in nums.enumerated() {
            if numsCount[num] == nil {
                numsCount[num] = 1
            } else {
                numsCount[num]! += 1
            }
            
            if firstSeen[num] == nil {
                firstSeen[num] = i
            }
            
            if let maxCount = numsCount[num], maxCount > degree {
                degree = maxCount
                minCount = i - (firstSeen[num] ?? 0) + 1
            } else if (numsCount[num] ?? 0) == degree {
                minCount = min(minCount, i - (firstSeen[num] ?? 0) + 1)
            }
        }
        
        return minCount
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
        XCTAssertEqual(s.findShortestSubArray([1, 2, 2, 3, 1]), 2)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.findShortestSubArray([1, 2, 2, 3, 1, 4, 2]), 6)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findShortestSubArray([1, 1]), 2)
        XCTAssertEqual(s.findShortestSubArray([2, 1]), 1)
        XCTAssertEqual(s.findShortestSubArray([1]), 1)
    }
}

Tests.defaultTestSuite.run()
