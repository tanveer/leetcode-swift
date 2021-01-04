import Foundation

// 905. Sort Array By Parity
// https://leetcode.com/problems/sort-array-by-parity

// MARK: - Solution
// ================
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        guard !A.isEmpty else { return [] }
        var nums = A
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let leftNum = nums[left]
            let rightNum = nums[right]
            
            if rightNum % 2 <    leftNum % 2 {
                nums.swapAt(left, right)
            }
            
            if leftNum % 2 == 0 {
                left += 1
            }
            
            if rightNum % 2 == 1 {
                right -= 1
            }
        }
        return nums
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
        XCTAssertEqual(s.sortArrayByParity([3, 1, 2, 4]), [4, 2, 1, 3])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.sortArrayByParity([]), [])
    }
}

Tests.defaultTestSuite.run()

