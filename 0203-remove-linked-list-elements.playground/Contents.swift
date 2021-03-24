import Foundation

// 203. Remove Linked List Elements
// https://leetcode.com/problems/remove-linked-list-elements

// MARK: - Solution
// ================
class Solution1 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else { return head }
        var head = head
        var prev: ListNode?
        var curr = head

        while curr != nil {
            if curr?.val == val {
                if prev == nil {
                    head = curr?.next
                } else {
                    prev?.next = curr?.next
                }
            } else {
                prev = curr
            }

            curr = curr?.next
        }
        return head
    }
}

class Solution2 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else { return head }
        let newHead = removeElements(head?.next, val)
        if head?.val == val {
            return newHead
        }

        head?.next = newHead
        return head
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


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s1 = Solution1()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s1.removeElements("1->2->6->3->4->5->6", 6), "1->2->3->4->5")
        XCTAssertEqual(s2.removeElements("1->2->6->3->4->5->6", 6), "1->2->3->4->5")
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s1.removeElements("1->2->2->1", 2), "1->1")
        XCTAssertEqual(s2.removeElements("1->2->2->1", 2), "1->1")
    }
}

Tests.defaultTestSuite.run()
