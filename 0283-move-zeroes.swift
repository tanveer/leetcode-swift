//
//  Created by Tanveer Bashir on 10/20/20.
//

import Foundation

// 283. Move Zeroes
// https://leetcode.com/problems/move-zeroes

// MARK: - Solution
// ================
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var index = 0

        for i in 0..<nums.count {
            if nums[i] != 0 {
                nums[index] = nums[i]
                index += 1
            }
        }

        for i in index..<nums.count  {
            nums[i] = 0
        }
    }

    // Using array's swatAt method
    func moveZeroesWithSwap(_ nums: inout [Int]) {
        var index = 0
        for cur in 0..<nums.count {
            if nums[cur] != 0 {
                nums.swapAt(index, cur)
                index += 1
            }
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
    func testLeetCodeExample() {
        var inoutInput = [0, 1, 0, 3, 12]
        s.moveZeroes(&inoutInput)
        XCTAssertEqual(inoutInput, [1, 3, 12, 0, 0])
    }

    func textmoveZerosWithSwap() {
        var inoutInput = [0, 1, 0, 3, 12]
        s.moveZeroesWithSwap(&inoutInput)
        XCTAssertEqual(inoutInput, [1, 3, 12, 0, 0])
    }

    // Additional Examples
    func testAdditionalExamples() {
        var inoutInput1: [Int] = []
        s.moveZeroes(&inoutInput1)
        XCTAssertEqual(inoutInput1, [])

        var inoutInput2: [Int] = [0]
        s.moveZeroes(&inoutInput2)
        XCTAssertEqual(inoutInput2, [0])

        var inoutInput3: [Int] = [1]
        s.moveZeroes(&inoutInput3)
        XCTAssertEqual(inoutInput3, [1])
    }
}

Tests.defaultTestSuite.run()

