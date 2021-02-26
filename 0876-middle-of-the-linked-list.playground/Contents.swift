import Foundation

// 876. Middle of the Linked List
// https://leetcode.com/problems/middle-of-the-linked-list

// MARK: - Solution
// ================
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var slow = head
        var fast = head

        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        return slow
    }
}

// Definition for singly-linked list.
public class ListNode: ExpressibleByArrayLiteral, ExpressibleByStringLiteral {
    public var val: Int
    public var next: ListNode?

    public convenience init() { self.init(0) }
    public convenience init(_ val: Int) { self.init(val, nil) }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next }

    init?(_ values: [Int]) {
        guard let firstVal = values.first else { return nil }
        self.val = firstVal
        self.append(contentsOf: values.dropFirst())
    }

    // Allow initialization as: let listNode: ListNode = "1->2->3"
    public required convenience init(stringLiteral: String) {
        let values = stringLiteral.replacingOccurrences(of: " ", with: "").components(separatedBy: "->").map { Int($0)! }
        guard let firstVal = values.first else { fatalError("Invalid Input String. Expecting Format: 1->2->3") }
        self.init(firstVal)
        self.append(contentsOf: values.dropFirst())
    }

    // Allow initialization as: let listNode: ListNode = [1, 2, 3]
    public required convenience init(arrayLiteral: Int...) {
        guard let firstVal = arrayLiteral.first else { fatalError("Cannot be used on empty arrays since they should represent nil") }
        self.init(firstVal)
        self.append(contentsOf: arrayLiteral.dropFirst())
    }

    private func append<S: Sequence>(contentsOf values: S) where S.Iterator.Element == Int {
        var current = self
        while let next = current.next {
            current = next
        }

        for num in values {
            let newNode = ListNode(num)
            current.next = newNode
            current = newNode
        }
    }
}

// This is to allow XCTAssertEqual to compare two LinkedLists
extension ListNode: Equatable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        var nullableLhs: ListNode? = lhs
        var nullableRhs: ListNode? = rhs

        while let l = nullableLhs, let r = nullableRhs {
            guard l.val == r.val else { return false }
            nullableLhs = l.next
            nullableRhs = r.next
        }

        return nullableLhs == nil && nullableRhs == nil
    }
}

// To allow displaying the LinkedList in format: 1 -> 2 -> 3
extension ListNode: CustomStringConvertible {
    public var description: String {
        return asString()
    }

    func asString() -> String {
        return asArray().map { String($0) }.joined(separator: " -> ")
    }

    func asArray() -> [Int] {
        var values = [Int]()
        var node: ListNode? = self
        while let current = node {
            values.append(current.val)
            node = current.next
        }
        return values
    }
}

class Solution2 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        var nodes = [head]
        var index = nodes.count

        while nodes[index - 1]?.next != nil {
            index = nodes.count
            nodes.append(nodes[index - 1]?.next)
        }

        return nodes[index / 2]
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
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        let list: ListNode = [1, 2, 3, 4, 5]
        let middleNode = list.next?.next
        XCTAssertEqual(middleNode?.val, 3)
        XCTAssertEqual(s.middleNode([1, 2, 3, 4, 5]), middleNode)
        XCTAssertEqual(s2.middleNode([1, 2, 3, 4, 5]), middleNode)
    }

    func testLeetCodeExample2() {
        let list: ListNode = [1, 2, 3, 4, 5, 6]
        let middleNode = list.next?.next?.next
        XCTAssertEqual(middleNode?.val, 4)
        XCTAssertEqual(s.middleNode([1, 2, 3, 4, 5, 6]), middleNode)
        XCTAssertEqual(s2.middleNode([1, 2, 3, 4, 5, 6]), middleNode)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertNil(s.middleNode(nil))
    }
}

Tests.defaultTestSuite.run()
