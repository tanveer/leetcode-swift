import Foundation

// 1389. Create Target Array in the Given Order
// https://leetcode.com/problems/create-target-array-in-the-given-order

// MARK: - Solution
// ================
class Solution1 {
    func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
        var target = [Int]()

        for (i, j) in zip(nums, index) {
            target.insert(i, at: j)
        }
        return target
    }
}

class Solution2 {
    func createTargetArray(_ nums: [Int], _ index: [Int]) -> [Int] {
        var target = [Int]()
        var i = 0
        var j = 0

        while i < nums.count {
            target.insert(nums[i], at: index[j])
            i += 1
            j += 1
        }
        return target
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
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.createTargetArray([0, 1, 2, 3, 4], [0, 1, 2, 2, 1]), [0, 4, 1, 3, 2])
        XCTAssertEqual(s2.createTargetArray([0, 1, 2, 3, 4], [0, 1, 2, 2, 1]), [0, 4, 1, 3, 2])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.createTargetArray([1, 2, 3, 4, 0], [0, 1, 2, 3, 0]), [0, 1, 2, 3, 4])
        XCTAssertEqual(s2.createTargetArray([1, 2, 3, 4, 0], [0, 1, 2, 3, 0]), [0, 1, 2, 3, 4])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s1.createTargetArray([1], [0]), [1])
        XCTAssertEqual(s2.createTargetArray([1], [0]), [1])
    }
}

Tests.defaultTestSuite.run()
