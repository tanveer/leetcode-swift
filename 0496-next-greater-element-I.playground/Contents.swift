import Foundation

// 496. Next Greater Element I
// https://leetcode.com/problems/next-greater-element-i

// MARK: - Solution
// ================
class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int]()
        var stack:[Int] = []
        
        for num in nums2 {
            while let top = stack.last, num > top {
                map[top] = num
                stack.removeLast()
            }
            stack.append(num)
        }
        
        var result = Array(repeating: -1, count: nums1.count)
        
        for i in 0..<nums1.count {
            let num = nums1[i]
            
            if let value = map[num] {
                result[i] = value
            }
        }
        
        return result
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
        XCTAssertEqual(s.nextGreaterElement([4, 1, 2], [1, 3, 4, 2]), [-1, 3, -1])
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.nextGreaterElement([2, 4], [1, 2, 3, 4]), [3, -1])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.nextGreaterElement([], []), [])
    }
}

Tests.defaultTestSuite.run()
