import Foundation

// 705. Design HashSet
// https://leetcode.com/problems/design-hashset

// MARK: - Solution
// ================
class MyHashSet {
    private var numBuckets = 1000
    private var hashSet = [[Int]]()
    
    private func hashValue(_ key: Int) -> Int {
        return key % hashSet.count
    }
    
    /** Initialize your data structure here. */
    init() {
        hashSet = [[Int]](repeating: [], count: numBuckets)
    }
    
    func add(_ key: Int) {
        let hash = hashValue(key)
        if !hashSet[hash].contains(key){
            hashSet[hash].append(key)
        }
    }
    
    func remove(_ key: Int) {
        let hash = hashValue(key)
        if let index = hashSet[hash].firstIndex(of: key) {
            hashSet[hash].remove(at: index)
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let hash = hashValue(key)
        return hashSet[hash].contains(key)
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(__REPLACE_ME_)
// Space Complexity: O(__REPLACE_ME__)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let hashSet = MyHashSet()
        hashSet.add(1)
        hashSet.add(2)
        XCTAssertTrue(hashSet.contains(1))    // returns true
        XCTAssertFalse(hashSet.contains(3))   // returns false (not found)
        hashSet.add(2)
        XCTAssertTrue(hashSet.contains(2))    // returns true
        hashSet.remove(2)
        XCTAssertFalse(hashSet.contains(2))   // returns false (already removed)
    }
}

Tests.defaultTestSuite.run()

