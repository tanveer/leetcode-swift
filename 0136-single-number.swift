//  Created by Tanveer Bashir on 10/17/20.
import UIKit

// 136. Single Number
//https://leetcode.com/problems/single-number/

// MARK: - Solution
// ================
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()

        for n in nums {
            if dict[n] != nil {
                dict[n] = nil
            } else {
                dict[n] = 1
            }
        }

        for value in dict {
            return value.key
        }
        return 0
    }
}

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // Leetcode Example
    func testLeetcpdeExample(){
        XCTAssertEqual(s.singleNumber([4,1,2,1,2]), 4)
    }

    func testAdditionalTest() {
        XCTAssertEqual(s.singleNumber([2,2,1]), 1)
    }
}

Tests.defaultTestSuite.run()
