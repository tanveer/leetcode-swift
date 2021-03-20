import Foundation

// 341. Flatten Nested List Iterator
// https://leetcode.com/problems/flatten-nested-list-iterator

// MARK: - Solution
// ================
/**
 *  // This is the interface that allows for creating nested lists.
 *  // You should not implement it, or speculate about its implementation
 *  class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 *  }
 */

class NestedInteger {
    var integer: Int?
    var nestedList: [NestedInteger]?

    init(_ integer: Int) {
        self.integer = integer
    }

    // Return true if this NestedInteger holds a single integer, rather than a nested list.
    public func isInteger() -> Bool {
        return integer != nil
    }

    // Return the single integer that this NestedInteger holds, if it holds a single integer
    // The result is undefined if this NestedInteger holds a nested list
    public func getInteger() -> Int {
        return integer!
    }

    // Set this NestedInteger to hold a single integer.
    public func setInteger(value: Int) {
        self.integer = value
        self.nestedList = nil
    }

    // Set this NestedInteger to hold a nested list and adds a nested integer to it.
    public func add(elem: NestedInteger) {
        self.integer = nil
        if nestedList != nil {
            nestedList?.append(elem)
        } else {
            nestedList = [elem]
        }
    }

    // Return the nested list that this NestedInteger holds, if it holds a nested list
    // The result is undefined if this NestedInteger holds a single integer
    public func getList() -> [NestedInteger] {
        return nestedList!
    }
}

class NestedIterator {
    private var flatenedArray = [Int]()
    private var index = 0

    init(_ nestedList: [NestedInteger]) {
        helper(nestedList)
    }

    private func helper(_ nestedList: [NestedInteger]) {
        for item in nestedList {
            if item.isInteger() {
                flatenedArray.append(item.getInteger())
            } else {
                helper(item.getList())
            }
        }
    }

    func next() -> Int {
        let val = flatenedArray[index]
        index += 1
        return val
    }

    func hasNext() -> Bool {
        return flatenedArray.count > index
    }
}

/**
 * Your NestedIterator object will be instantiated and called as such:
 * let obj = NestedIterator(nestedList)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExample1() {
        // [[1, 2], 3, [4, 5]]
        let nestedList12 = NestedInteger(Int.min)
        nestedList12.add(elem: NestedInteger(1))
        nestedList12.add(elem: NestedInteger(2))

        let nestedInteger3 = NestedInteger(3)

        let nestedList45 = NestedInteger(Int.min)
        nestedList45.add(elem: NestedInteger(4))
        nestedList45.add(elem: NestedInteger(5))

        let nestedList = [nestedList12, nestedInteger3, nestedList45]  // [[1, 2], 3, [4, 5]]

        let nestedIterator = NestedIterator(nestedList)
        XCTAssertEqual(nestedIterator.next(), 1)
        XCTAssertTrue(nestedIterator.hasNext())
        XCTAssertEqual(nestedIterator.next(), 2)
        XCTAssertTrue(nestedIterator.hasNext())
        XCTAssertEqual(nestedIterator.next(), 3)
        XCTAssertTrue(nestedIterator.hasNext())
        XCTAssertEqual(nestedIterator.next(), 4)
        XCTAssertTrue(nestedIterator.hasNext())
        XCTAssertEqual(nestedIterator.next(), 5)
        XCTAssertFalse(nestedIterator.hasNext())
    }

    func testLeetCodeExample2() {
        // [1, [4, [6]]]
        let nestedList6 = NestedInteger(6)
        let nestedList4 = NestedInteger(Int.min)
        nestedList4.add(elem: NestedInteger(4))
        nestedList4.add(elem: nestedList6)

        let nestedIterator = NestedIterator([NestedInteger(1), nestedList4]) // [1, [4, [6]]]
        XCTAssertEqual(nestedIterator.next(), 1)
        XCTAssertTrue(nestedIterator.hasNext())
        XCTAssertEqual(nestedIterator.next(), 4)
        XCTAssertTrue(nestedIterator.hasNext())
        XCTAssertEqual(nestedIterator.next(), 6)
        XCTAssertFalse(nestedIterator.hasNext())
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        // [[]]
        let nestedIterator = NestedIterator([])
        XCTAssertFalse(nestedIterator.hasNext())
    }
}

Tests.defaultTestSuite.run()
