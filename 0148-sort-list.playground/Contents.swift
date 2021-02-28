import Foundation

// 148. Sort List
// https://leetcode.com/problems/sort-list

// MARK: - Solution
// ================
class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard  let head = head else { return nil }
        guard head.next != nil else { return head }

        var slow: ListNode? = head
        var fast: ListNode? = head
        var prev: ListNode?

        while fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prev?.next = nil

        return merge(sortList(head), sortList(slow))
    }

    func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        let prevHead = ListNode(-1)
        var curr = prevHead

        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                curr.next = list1
                list1 = list1?.next
            } else {
                curr.next = list2
                list2 = list2?.next
            }
            curr = curr.next!
        }

        curr.next = (list1 != nil) ? list1 : list2
        return prevHead.next
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
// Time Complexity: O(nlog(n))
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.sortList([4, 2, 1, 3]), [1, 2, 3, 4])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.sortList([-1, 5, 3, 4, 0]), [-1, 0, 3, 4, 5])
    }

    func testLeetCodeExample3() {
        XCTAssertNil(s.sortList(nil))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.sortList([1]), [1])
        XCTAssertEqual(s.sortList([1, 2]), [1, 2])
        XCTAssertEqual(s.sortList([2, 1]), [1, 2])
    }
}

Tests.defaultTestSuite.run()
