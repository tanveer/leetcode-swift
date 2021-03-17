import Foundation

// 378. Kth Smallest Element in a Sorted Matrix
// https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix

// MARK: - Solution
// ================
class Solution1 {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let rows = matrix.count
        let cols = matrix[0].count
        var left = matrix[0][0]
        var right = matrix[rows - 1][cols - 1]

        while left < right {
            let middle = (left + right) / 2
            var j = cols - 1
            var count = 0

            for i in 0..<rows {
                while j >= 0, matrix[i][j] > middle {
                    j -= 1
                }
                if j < 0 { break }
                count += j + 1
            }

            if count < k {
                left = middle + 1
            } else {
                right = middle
            }
        }
        return left
    }
}

class Solution2 {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        // make 1D array of matrix
        var nums = [Int]()
        for r in 0..<matrix.count {
            for c in 0..<matrix[0].count {
                nums.append(matrix[r][c])
            }
        }


        var heap = Heap(nums, priority: <)
        var element = -1
        for _ in 0..<k {
            element = heap.extract()!
        }
        return element
    }
}

// MAEK: - Heap
//=============

public struct Heap<Element> {
    private var elements: [Element]
    private let priority: (Element, Element) -> Bool

    var count: Int {
        return elements.count
    }

    var isEmpty: Bool {
        return elements.isEmpty
    }

    public init(_ elements: [Element] = [], priority: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priority = priority
        self.buildHeap()
    }

    mutating func buildHeap() {
        for index in (0..<count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }

    func peek() -> Element? {
        return elements.first
    }

    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }

    private func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }

    private func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }

    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priority(elements[firstIndex], elements[secondIndex])
    }

    private func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count, isHigherPriority(at: childIndex, than: parentIndex)
        else { return parentIndex }
        return childIndex
    }

    private func highestPriorityIndex(for parent: Int) -> Int {
        let leftChild = leftChildIndex(of: parent)
        let rightChild = rightChildIndex(of: parent)
        let priorityIndexOfParent = highestPriorityIndex(of: parent, and: leftChild)
        let prirityIndex = highestPriorityIndex(of: priorityIndexOfParent, and: rightChild)
        return prirityIndex
    }

    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
        else { return }
        elements.swapAt(firstIndex, secondIndex)
    }

    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }

    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index), isHigherPriority(at: index, than: parent) else {
            return
        }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }

    mutating func extract() -> Element? {
        guard !isEmpty else {
            return nil
        }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }

    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(nlog(n)) // with binary search
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    let matrix = [
        [1, 5, 9],
        [10, 11, 13],
        [12, 13, 15],
    ]

    // LeetCode Examples
    func testLeecodeExample1() {
        XCTAssertEqual(s1.kthSmallest(matrix, 8), 13)
        XCTAssertEqual(s2.kthSmallest(matrix, 8), 13)
    }

    func testLeecodeExample2() {
        XCTAssertEqual(s1.kthSmallest([[1, 2], [1, 3]], 2), 1)
        XCTAssertEqual(s2.kthSmallest([[1, 2], [1, 3]], 2), 1)
    }
}

Tests.defaultTestSuite.run()
