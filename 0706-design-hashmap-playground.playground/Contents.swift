import Foundation

// 706. Design HashMap
// https://leetcode.com/problems/design-hashmap

// MARK: - Solution
// ================
class MyHashMap {
    private var hashMap: [Int?]
    
    /** Initialize your data structure here. */
    init() {
        hashMap = Array(repeating: -1, count: 100_000)
    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        if let _ = hashMap[key] {
            hashMap[key] = value
        } else {
            hashMap[key] = value
        }
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        return hashMap[key] ?? -1
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        if let _ = hashMap[key] {
            hashMap[key] = nil
        }
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
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
    func testLeetCodeExampleCall() {
        let map = MyHashMap()
        
        map.put(1, 1)
        map.put(2, 2)
        
        XCTAssertEqual(map.get(1), 1) // returns 1
        XCTAssertEqual(map.get(3),-1) // return -1
        XCTAssertEqual(map.get(2), 2) // return 2
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        let map = MyHashMap()
        map.put(2, 1)
        
        XCTAssertEqual(map.get(2), 1)  // returns 1
        
        map.remove(2)
        XCTAssertEqual(map.get(2), -1) // returns -1
        
    }
}

Tests.defaultTestSuite.run()

