import Foundation

// 324. Wiggle Sort II
// https://leetcode.com/problems/wiggle-sort-ii

// MARK: - Solution
// ================
class Solution {
    func wiggleSort(_ nums: inout [Int]) {
        let temp = nums.sorted() // sort array
        var mid = nums.count / 2 // get mid point of sortrd array
        var count = nums.count - 1 // size of input array
        var mid2 = nums.count - mid

        var index = 1
        while mid != 0 {
            nums[index] = temp[count]
            index += 2
            mid -= 1
            count -= 1
        }

        index = 0
        while mid2 != 0 {
            nums[index] = temp[count]
            index += 2
            mid2 -= 1
            count -= 1
        }
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

    func isWiggleSorted(_ nums: [Int]) -> Bool {
        for i in nums.indices.dropLast() {
            guard i.isMultiple(of: 2) && nums[i] < nums[i + 1] ||
                !i.isMultiple(of: 2) && nums[i] > nums[i + 1]
            else {
                return false
            }
        }

        return true
    }

    func testIsWiggleSorted() {
        // Example 1
        XCTAssertFalse(isWiggleSorted([1, 5, 1, 1, 6, 4]))
        XCTAssertTrue(isWiggleSorted([1, 6, 1, 5, 1, 4]))
        XCTAssertTrue(isWiggleSorted([1, 4, 1, 5, 1, 6]))

        // Example 2
        XCTAssertFalse(isWiggleSorted([1, 3, 2, 2, 3, 1]))
        XCTAssertTrue(isWiggleSorted([2, 3, 1, 3, 1, 2]))
    }

    // LeetCode Examples
    func testLeetCodeExample1() {
        var inoutInput = [1, 5, 1, 1, 6, 4]
        s.wiggleSort(&inoutInput)
        XCTAssertTrue(isWiggleSorted(inoutInput), "\(inoutInput) is not wiggle sorted")
    }

    func testLeetCodeExample2() {
        var inoutInput = [1, 3, 2, 2, 3, 1]
        s.wiggleSort(&inoutInput)
        XCTAssertTrue(isWiggleSorted(inoutInput), "\(inoutInput) is not wiggle sorted")
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        var inoutInput = [1, 1, 2, 1, 2, 2, 1]
        s.wiggleSort(&inoutInput)
        XCTAssertTrue(isWiggleSorted(inoutInput), "\(inoutInput) is not wiggle sorted")
    }

    func testLeetCodeTest2() {
        var inoutInput = [4, 5, 5, 6]
        s.wiggleSort(&inoutInput) // [5, 6, 4, 5]
        XCTAssertTrue(isWiggleSorted(inoutInput), "\(inoutInput) is not wiggle sorted")
    }

    // Additional Examples
    func testAdditionalExamples() {
        var inoutInput: [Int] = []
        s.wiggleSort(&inoutInput)
        XCTAssertTrue(isWiggleSorted(inoutInput), "\(inoutInput) is not wiggle sorted")
    }
}

Tests.defaultTestSuite.run()
