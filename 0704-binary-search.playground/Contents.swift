import Foundation

// 704. Binary Search
// https://leetcode.com/problems/binary-search

// MARK: - Solution
// ================
class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var leftIndex = 0
        var rightIndex = nums.count - 1
        
        while leftIndex <= rightIndex {
            let mid = leftIndex + (rightIndex - leftIndex) / 2
            if nums[mid] == target {
                return mid
            }
            
            if target < nums[mid] {
                rightIndex = mid - 1
            } else {
                leftIndex = mid + 1
            }
        }
        
        return -1
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
        XCTAssertEqual(s.search([-1, 0, 3, 5, 9, 12], 9), 4)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.search([-1, 0, 3, 5, 9, 12], 2), -1)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.search([], 0), 0)
    }
}

Tests.defaultTestSuite.run()

