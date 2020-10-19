//  Created by Tanveer Bashir on 10/19/20.
//

import Foundation

// 169. Majority Element
// https://leetcode.com/problems/majority-element

// MARK: - Solution
// ================
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0
        var candidate = 0
        
        for num in nums {
            if count == 0 {
                candidate = num
            }
            count += num == candidate ? 1 : -1
        }
        return candidate
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
        XCTAssertEqual(s.majorityElement([3, 2, 3]), 3)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.majorityElement([2, 2, 1, 1, 1, 2, 2]), 2)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.majorityElement([]), 0)
    }
}

Tests.defaultTestSuite.run()
