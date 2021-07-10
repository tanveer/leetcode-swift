import Foundation

// 215. Kth Largest Element in an Array
// https://leetcode.com/problems/kth-largest-element-in-an-array

// MARK: - Solution
// ================
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap()

        for n in nums {
            heap.add(n)
        }

        var count = heap.count - k
        while count != 0 {
            heap.poll()
            count -= 1
        }

        return heap.top ?? -1
    }
}

struct Heap {
    private var items = [Int]()

    var count: Int {
        return items.count
    }

    var top: Int? {
        return items.first
    }

    private func getLeftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }

    private func getRightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }

    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }

    private func hasLeftChild(_ index: Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }

    private func hasRightChild(_ index: Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }

    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0
    }


    // access nodes
    private func leftChild(_ index: Int) -> Int {
        return items[getLeftChildIndex(index)]
    }

    private func rightChild(_ index: Int) -> Int {
        return items[getRightChildIndex(index)]
    }

    private func parent(_ index: Int) -> Int {
        return items[getParentIndex(index)]
    }

    private mutating func bubbleUp() {
        var index = count - 1
        while hasParent(index), parent(index) > items[index] {
            let parentIndex = getParentIndex(index)
            items.swapAt(parentIndex, index)
            index = parentIndex
        }
    }

    private mutating func bubbleDown() {
        var index = 0
        while hasLeftChild(index) {
            var leftChildIndex = getLeftChildIndex(index)

            if hasRightChild(index), rightChild(index) < leftChild(index) {
                leftChildIndex = getRightChildIndex(index)
            }

            if items[index] > items[leftChildIndex] {
                items.swapAt(index, leftChildIndex)
            }
            index = leftChildIndex
        }
    }

    public mutating func add(_ item: Int) {
        items.append(item)
        bubbleUp()
    }

    public func peek() -> Int? {
        return top
    }

    public mutating func poll() -> Int? {
        guard top != nil else { return nil }
        let item = top
        items[0] = items[count - 1]
        bubbleDown()
        items.removeLast()
        return item
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(nlogk)
// Space Complexity: O(k)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.findKthLargest([3, 2, 1, 5, 6, 4], 2), 5)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.findKthLargest([3, 2, 3, 1, 2, 4, 5, 5, 6], 4), 4)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.findKthLargest([0], 1), 0)
    }
}

Tests.defaultTestSuite.run()
