import Foundation

// 11. Container With Most Water
// https://leetcode.com/problems/container-with-most-water

// MARK: - Solution
// ================
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        guard !height.isEmpty else { return 0 }
        var maxWaterArea = Int.min
        var left = 0
        var right = height.count - 1
        
        while left < right {
            let minBound = min(height[left], height[right])
            maxWaterArea = max(maxWaterArea, minBound * ( right - left))
            
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxWaterArea
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
        XCTAssertEqual(s.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]), 49)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.maxArea([1, 1]), 1)
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.maxArea([4, 3, 2, 1, 4]), 16)
    }
    
    func testLeetCodeExample4() {
        XCTAssertEqual(s.maxArea([1, 2, 1]), 2)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxArea([]), 0)
    }
}

Tests.defaultTestSuite.run()
