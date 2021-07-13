import Foundation

// 1060. Missing Element in Sorted Array
// https://leetcode.com/problems/missing-element-in-sorted-array

// MARK: - Solution
// ================
class Solution1 {
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        var original = k
        var difference = 0
        let count = nums.count

        for i in 1..<count {
            difference = nums[i] - nums[i - 1] - 1

            if difference >= original {
                return nums[i - 1] + original
            }
            original -= difference
        }
        return nums[count - 1] + original
    }
}

class Solution2 {
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else { return 0 }

        let count = nums.count

        if k > missingNumber(count - 1, nums) {
            return nums[count - 1] + k - missingNumber(count - 1, nums)
        }

        var left = 0
        var right = count - 1

        while left != right {
            let mid = left + (right - left) / 2

            if missingNumber(mid, nums) < k {
                left = mid + 1
            } else {
                right = mid
            }
        }

        return nums[left - 1] + k - missingNumber(left - 1, nums)
    }

    func missingNumber(_ index: Int, _ nums: [Int]) -> Int {
        return nums[index] - nums[0] - index
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n) // using for loop in one pass log(n) with Binary search
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.missingElement([4, 7, 9, 10], 1), 5)
        XCTAssertEqual(s2.missingElement([4, 7, 9, 10], 1), 5)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s1.missingElement([4, 7, 9, 10], 3), 8)
        XCTAssertEqual(s2.missingElement([4, 7, 9, 10], 3), 8)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s1.missingElement([1, 2, 4], 3), 6)
        XCTAssertEqual(s2.missingElement([1, 2, 4], 3), 6)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s1.missingElement([], 0), 0)
        XCTAssertEqual(s2.missingElement([], 0), 0)
    }
}

Tests.defaultTestSuite.run()
