import Foundation

// 92. Reverse Linked List II
// https://leetcode.com/problems/reverse-linked-list-ii

// MARK: - Solution
// ================
class Solution {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        var left = m
        var right = n
        let start: ListNode? = ListNode(0)
        start?.next = head

        var prev = start
        var leftPointer = head
        var rightPointer = head

        while right > left {
            rightPointer = rightPointer?.next
            right -= 1
        }

        while left > 1 {
            leftPointer = leftPointer?.next
            rightPointer = rightPointer?.next
            prev = prev?.next
            left -= 1
        }

        let temp = rightPointer?.next
        while leftPointer?.next != temp {
            let node = leftPointer?.next
            leftPointer?.next = node?.next // cut off next node

            node?.next = prev?.next
            prev?.next = node
        }

        return start?.next
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
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.reverseBetween("1->2->3->4->5", 2, 4), "1->4->3->2->5")
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.reverseBetween("5", 1, 1), "5")
    }

    // LeetCode Tests
    func testLeetCodeTest1() {
        XCTAssertEqual(s.reverseBetween("3->5", 1, 2), "5->3")
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.reverseBetween("1->2->3", 1, 3), "3->2->1")
    }
}

Tests.defaultTestSuite.run()
