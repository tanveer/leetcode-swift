import Foundation

// 31. Next Permutation
// https://leetcode.com/problems/next-permutation

// MARK: - Solution
// ================
class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let k = findLargestK(nums)
        if k >= 0 {
            let l = findLargetL(nums, k)
            nums.swapAt(k, l)
        }
        reverse(&nums, k + 1)
    }

    func findLargestK(_ nums: [Int]) -> Int {
        var k = nums.count - 2
        while k >= 0, nums[k] >= nums[k + 1] {
            k -= 1
        }
        return k
    }

    func findLargetL(_ nums: [Int], _ k: Int) -> Int {
        var l = nums.count - 1
        while l >= k, nums[k] >= nums[l] {
            l -= 1
        }
        return l
    }

    func reverse(_ nums: inout [Int], _ start: Int) {
        var left = start
        var right = nums.count - 1

        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(?)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        var inoutInput = [1, 2, 3]
        s.nextPermutation(&inoutInput)
        XCTAssertEqual(inoutInput, [1, 3, 2])
    }

    func testLeetCodeExample2() {
        var inoutInput = [3, 2, 1]
        s.nextPermutation(&inoutInput)
        XCTAssertEqual(inoutInput, [1, 2, 3])
    }

    func testLeetCodeExample3() {
        var inoutInput = [1, 1, 5]
        s.nextPermutation(&inoutInput)
        XCTAssertEqual(inoutInput, [1, 5, 1])
    }

    func testLeetCodeExample4() {
        var inoutInput = [1]
        s.nextPermutation(&inoutInput)
        XCTAssertEqual(inoutInput, [1])
    }
}

Tests.defaultTestSuite.run()
