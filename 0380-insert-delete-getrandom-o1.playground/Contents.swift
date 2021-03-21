import Foundation

// 380. Insert Delete GetRandom O(1)
// https://leetcode.com/problems/insert-delete-getrandom-o1

// MARK: - Solution
// ================
class RandomizedSet {
    private(set) var set = Set<Int>()
    /** Initialize your data structure here. */
    init() {}

    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        return set.insert(val).inserted
    }

    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if set.contains(val) {
            set.remove(val)
            return true
        }
        return false
    }

    /** Get a random element from the set. */
    func getRandom() -> Int {
        return set.randomElement()!
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(?)
// Space Complexity: O(?)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let obj = RandomizedSet()
        XCTAssertTrue(obj.insert(1))
        XCTAssertFalse(obj.remove(2))
        XCTAssertTrue(obj.insert(2))
        XCTAssertEqual(obj.getRandom(), obj.set.randomElement()!)
        XCTAssertTrue(obj.remove(1))
        XCTAssertFalse(obj.insert(2))
        XCTAssertEqual(obj.getRandom(), obj.set.randomElement()!)
    }
}

Tests.defaultTestSuite.run()
