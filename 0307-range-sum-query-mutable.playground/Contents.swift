import Foundation

// 307. Range Sum Query - Mutable
// https://leetcode.com/problems/range-sum-query-mutable

// MARK: - Solution
// ================
class NumArray {
    private var nums: [Int]
    private var blockSums: [Int]

    init(_ nums: [Int]) {
        self.nums = nums
        let blockCount = Int(sqrt(Double(nums.count)).rounded(.up))
        blockSums = [Int](repeating: 0, count: blockCount)

        for (i, num) in nums.enumerated() {
            blockSums[i / blockCount] += num
        }
    }

    func update(_ i: Int, _ val: Int) {
        let blockNum = i / blockSums.count
        blockSums[blockNum] += val - nums[i]
        nums[i] = val
    }

    func sumRange(_ i: Int, _ j: Int) -> Int {
        let blockCount = blockSums.count
        let startBlock = i / blockCount
        let startBlockStartIndex = startBlock * blockCount
        let endBlock = j / blockCount
        let endBlockEndIndex = min(endBlock * blockCount + (blockCount - 1), nums.count - 1)

        var blockSum = blockSums[startBlock...endBlock].reduce(0, +)

        for k in startBlockStartIndex..<i {
            blockSum -= nums[k]
        }

        for k in stride(from: j + 1, through: endBlockEndIndex, by: 1) {
            blockSum -= nums[k]
        }

        return blockSum
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(i, val)
 * let ret_2: Int = obj.sumRange(i, j)
 */


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n) for init, O(sqrt(n)) for sumRange, 0(1) for update
// Space Complexity: O(sqrt(n))


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let numArray = NumArray([1, 3, 5])
        XCTAssertEqual(numArray.sumRange(0, 2), 9) // return 9 = sum([1,3,5])
        numArray.update(1, 2)   // nums = [1,2,5]
        XCTAssertEqual(numArray.sumRange(0, 2), 8) // return 8 = sum([1,2,5])
    }

    // Additional Examples
    func testAdditionalExamples() {
        let numArray = NumArray([1, 4, 3, 6, 7, 5, 2, 0, 9])
        XCTAssertEqual(numArray.sumRange(1, 7), 27)
    }
}

Tests.defaultTestSuite.run()
