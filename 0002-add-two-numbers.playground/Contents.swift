import Foundation

// 2. Add Two Numbers
// https://leetcode.com/problems/add-two-numbers

// MARK: - Solution
// ================
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        var carry = 0
        let node: ListNode? = ListNode(0)
        var curr = node

        while list1 != nil || list2 != nil {
            let value1 = list1?.val ?? 0
            let value2 = list2?.val ?? 0

            let sum = carry + value1 + value2
            carry = sum / 10
            let val = sum % 10

            curr?.next = ListNode(val)
            curr = curr?.next
            if list1 != nil { list1 = list1?.next }
            if list2 != nil { list2 = list2?.next }
        }

        if carry > 0 {
            curr?.next = ListNode(carry)
        }

        return node?.next
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
// Time Complexity: O(max(m, n))
// Space Complexity: O(max(m, n))

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.addTwoNumbers([2, 4, 3], [5, 6, 4]), [7, 0, 8])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.addTwoNumbers([0], [0]), [0])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.addTwoNumbers([9, 9, 9, 9, 9, 9, 9], [9, 9, 9, 9]), [8, 9, 9, 9, 0, 0, 0, 1]) // 9999999 + 9999 == 10009998 -> 89990001
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertNil(s.addTwoNumbers(nil, nil))
        XCTAssertEqual(s.addTwoNumbers([1, 2], nil), [1, 2])
        XCTAssertEqual(s.addTwoNumbers(nil, [3, 4]), [3, 4])
        XCTAssertEqual(s.addTwoNumbers([9, 9], [1]), [0, 0, 1]) // 99 + 1 == 100 -> 0->0->1
    }
}

Tests.defaultTestSuite.run()
