import Foundation

// 138. Copy List with Random Pointer
// https://leetcode.com/problems/copy-list-with-random-pointer

// MARK: - Solution
// ================
class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        var map = [Node?: Node]()
        var curr = head

        while curr != nil {
            map[curr] = Node(curr!.val)
            curr = curr?.next
        }

        for node in map {
            let newNode = map[node.key]
            newNode?.next = map[node.key?.next]
            newNode?.random = map[node.key?.random]
        }

        return map[head]
    }

    func copyRandomListWitoutExtraSpace(_ head: Node?) -> Node? {
        guard head != nil else { return nil }
        var temp = head

        while temp != nil {
            let newNode = Node(temp!.val)
            newNode.next = temp?.next
            newNode.random = temp?.random
            temp?.next = newNode
            temp = temp?.next?.next
        }

        // update random pointer
        let newHead = head?.next // this new head will be return as final LinkedList
        temp = head // reset temp to head

        while temp != nil {
            let next = temp?.next
            if next?.random != nil {
                next?.random = next?.random?.next
            }
            temp = next?.next
        }

        // unwinding the list
        temp = head
        while temp != nil {
            let copy = temp?.next
            temp?.next = copy?.next
            if copy?.next != nil {
                copy?.next = temp?.next?.next
            }
            temp = temp?.next
        }

        return newHead
    }
}

// Definition for a Node.
public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?

    public init(_ val: Int, _ next: Node? = nil) {
        self.val = val
        self.next = next
        self.random = nil
    }
}

// Implement Hashable to store a node in a dictionary
extension Node: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

// This is to allow XCTAssertEqual to compare two Nodes
extension Node: Equatable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        var nullableLhs: Node? = lhs
        var nullableRhs: Node? = rhs

        while let l = nullableLhs, let r = nullableRhs {
            guard l.val == r.val else { return false }
            guard l.random?.val == r.random?.val else { return false }
            nullableLhs = l.next
            nullableRhs = r.next
        }

        return nullableLhs == nil && nullableRhs == nil
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(1) not using hasset
// Space Complexity: O(n) extra space is required for hashSet

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        let node1 = Node(1)
        let node10 = Node(10, node1)
        let node11 = Node(11, node10)
        let node13 = Node(13, node11)
        let node7 = Node(7, node13)
        node7.random = nil
        node13.random = node7
        node11.random = node1
        node10.random = node11
        node1.random = node7

        let head = node7
        let copy = s.copyRandomList(head)
        XCTAssertEqual(head, copy)
        XCTAssertTrue(head !== copy)
    }

    func testLeetCodeExample2() {
        let node2 = Node(2)
        let node1 = Node(1, node2)
        node2.random = node2

        let head = node1
        let copy = s.copyRandomListWitoutExtraSpace(head)
        XCTAssertEqual(head, copy)
        XCTAssertTrue(head !== copy)
    }

    func testLeetCodeExample3() {
        let node3c = Node(3)
        let node3b = Node(3, node3c)
        let node3a = Node(3, node3b)
        node3b.random = node3a

        let head = node3a
        let copy = s.copyRandomListWitoutExtraSpace(head)
        XCTAssertEqual(head, copy)
        XCTAssertTrue(head !== copy)
    }

    func testLeetCodeExample4() {
        XCTAssertNil(s.copyRandomList(nil))
    }

    // Additional Examples
    func testAdditionalExamples() {
        let node1 = Node(1)

        let head = node1
        let copy = s.copyRandomList(head)
        XCTAssertEqual(head, copy)
        XCTAssertTrue(head !== copy)
    }
}

Tests.defaultTestSuite.run()
