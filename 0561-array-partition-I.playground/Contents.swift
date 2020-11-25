import Foundation

// 561. Array Partition I
// https://leetcode.com/problems/array-partition-i

// MARK: - Solution
// ================
class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return -1 }
        
        let sortedNums = nums.sorted()
        var sum = 0
        
        for i in stride(from: 0, to: sortedNums.count, by: 2) {
            sum += sortedNums[i]
        }
        
        return sum
    }
    
    func arrayPairSum_WhileLoop(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return -1 }
        let sortedNums = nums.sorted()
        var index = 0
        var sum = 0
        
        while index < sortedNums.count {
            sum += sortedNums[index]
            index += 2
        }
        
        return sum
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
        XCTAssertEqual(s.arrayPairSum([1, 4, 3, 2]), 4)
        
    }
    
    func testLeetcodeExample2() {
        XCTAssertEqual(s.arrayPairSum([6,2,6,5,1,2]), 9)
    }
    
    // Additional Examples
    func testAdditionalExample1() {
        XCTAssertEqual(s.arrayPairSum_WhileLoop([1,4,3,2]), 4)
    }
    
    func testAdditionalExample2() {
        XCTAssertEqual(s.arrayPairSum([6,2,6,5,1,2]), 9)
    }
    
}

Tests.defaultTestSuite.run()
