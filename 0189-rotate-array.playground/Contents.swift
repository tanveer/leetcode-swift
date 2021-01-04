import UIKit

// 189. Rotate Array
// https://leetcode.com/problems/rotate-array

// MARK: - Solution
// ================
class Solution {
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard !nums.isEmpty else { return }
        
        var rotationValue = k
        
        if k > nums.count {
            rotationValue = k % nums.count
        }
        
        let prefix = nums.suffix(rotationValue)
        let suffix = nums.prefix(nums.count - rotationValue)
        nums = Array(prefix + suffix)
    }
    
    func rotate_secndSolution(_ nums: inout [Int], _ k: Int) {
        guard !nums.isEmpty else { return }
        var rotationValue = k
        
        if k > nums.count {
            rotationValue = k % nums.count
        }
        
        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, rotationValue - 1)
        reverse(&nums, rotationValue, nums.count - 1)
    }
    
    func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        while start < end {
            let temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1
        }
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
        var inoutInput = [1, 2, 3, 4, 5, 6, 7]
        s.rotate(&inoutInput, 3)
        XCTAssertEqual(inoutInput, [5, 6, 7, 1, 2, 3, 4])
    }
    
    func testLeetCodeExample2() {
        var inoutInput = [-1, -100, 3, 99]
        s.rotate(&inoutInput, 2)
        XCTAssertEqual(inoutInput, [3, 99, -1, -100])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        var inoutInput: [Int] = []
        s.rotate(&inoutInput, 0)
        XCTAssertEqual(inoutInput, [])
    }
    func testLeetCodeExample3() {
        var inoutInput = [1, 2, 3, 4, 5, 6, 7]
        s.rotate_secndSolution(&inoutInput, 3)
        XCTAssertEqual(inoutInput, [5, 6, 7, 1, 2, 3, 4])
    }
}

Tests.defaultTestSuite.run()

