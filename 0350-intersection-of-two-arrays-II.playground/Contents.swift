import Foundation

// 350. Intersection of Two Arrays II
// https://leetcode.com/problems/intersection-of-two-arrays-ii

// MARK: - Solution
// ================
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var dict = [Int: Int]()
        var result = [Int]()
        
        for num in nums1 {
            dict[num, default: 0] += 1
        }
        
        for num in nums2 {
            if let count = dict[num] {
                if count > 0 {
                    dict[num] = count - 1
                    result.append(num)
                }
            }
        }
        
        return result
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
        XCTAssertEqual(s.intersect([1, 2, 2, 1], [2, 2]), [2, 2])
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.intersect([4, 9, 5], [9, 4, 9, 8, 4]), [9, 4])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.intersect([], []), [])
    }
}

Tests.defaultTestSuite.run()
