import Foundation

// 146. LRU Cache
// https://leetcode.com/problems/lru-cache

// MARK: - Solution
// ================
class LRUCache {
    private var dict = [Int: Node]()
    private var capacity: Int
    private var doublyLinkedList = DoublyLinkedList()

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        if let node = dict[key] {
            doublyLinkedList.moveToHead(node)
            return node.val
        }
        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            // node is already present update value
            node.val = value
            doublyLinkedList.moveToHead(node)
        } else {
            let newNode = Node(key, value)
            doublyLinkedList.moveToHead(newNode)
            dict[key] = newNode
        }

        if dict.count > capacity {
            if let node = doublyLinkedList.removeFromTail() {
                dict[node.val] = nil
            }
        }
    }
}

class Node {
    var val: Int
    private var key: Int
    var next: Node?
    weak var prev: Node?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class DoublyLinkedList {
    var head: Node
    var tail: Node

    init() {
        head = Node(0, 0)
        tail = Node(0, 0)
        head.next = tail
        tail.prev = head
    }

    func moveToHead(_ node: Node) {
        // If node is already in the DLL remove it first
        if let prev = node.prev, let next = node.next {
            prev.next = next
            next.prev = prev
        }

        // Making connections between the node and the node before head
        node.next = head.next
        head.next?.prev = node

        // Adding connections between head and the node
        head.next = node
        node.prev = head
    }

    func removeFromTail() -> Node? {
        // If the list is empty return nil
        if tail.prev === head {
            return nil
        }

        // Remove the node by connecting tail and node.prev
        let node = tail.prev
        node?.prev?.next = tail
        tail.prev = node?.prev

        node?.next = nil
        node?.prev = nil

        return node
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(1)
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    // LeetCode Examples
    func testLeetCodeExampleCall() {
        let lruCache = LRUCache(2)
        lruCache.put(1, 1) // cache is {1=1}
        lruCache.put(2, 2) // cache is {1=1, 2=2}
        XCTAssertEqual(lruCache.get(1), 1)  // return 1
        lruCache.put(3, 3) // LRU key was 2, evicts key 2, cache is {1=1, 3=3}
        XCTAssertEqual(lruCache.get(2), -1) // returns -1 (not found)
        lruCache.put(4, 4) // LRU key was 1, evicts key 1, cache is {4=4, 3=3}
        XCTAssertEqual(lruCache.get(1), -1) // return -1 (not found)
        XCTAssertEqual(lruCache.get(3), 3)  // return 3
        XCTAssertEqual(lruCache.get(4), 4)  // return 4
    }
}

Tests.defaultTestSuite.run()
