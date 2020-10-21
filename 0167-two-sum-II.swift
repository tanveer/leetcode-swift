//
//  Created by Tanveer Bashir on 10/21/20.
//

import Foundation

// 167. Two Sum II - Input array is sorted
// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted

// MARK: - Solution
// ================
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var map: [Int: Int] = [:]
        
        for i in 0..<numbers.count {
            let currentValue = target - numbers[i]
            if let index = map[currentValue] {
                return [index + 1 , i + 1]
            } else {
                map[numbers[i]] = i
            }
        }
        return []
    }
    
    func twoSum2PointerSolution(_ numbers: [Int], _ target: Int) -> [Int] {
        var leftIndex = 0
        var rightIndex = numbers.count - 1
        
        while leftIndex < rightIndex{
            let sum = numbers[leftIndex] + numbers[rightIndex]
            
            if sum == target {
                return [leftIndex + 1, rightIndex + 1]
            } else if sum < target {
                leftIndex += 1
            } else {
                rightIndex -= 1
            }
        }
        return [-1, -1]
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
        XCTAssertEqual(s.twoSum([2, 7, 11, 15], 9), [1, 2])
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.twoSum([2, 3, 4], 6), [1, 3])
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.twoSum([-1, 0], -1), [1, 2])
    }
    func testLeecodeExample4() {
        XCTAssertEqual(s.twoSum2PointerSolution([2,7,11,15], 9), [1,2])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.twoSum([], 0), [-1, -1])
    }
}

Tests.defaultTestSuite.run()
