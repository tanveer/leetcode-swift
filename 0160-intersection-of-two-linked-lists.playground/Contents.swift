import Foundation

// 160. Intersection of Two Linked Lists
// https://leetcode.com/problems/intersection-of-two-linked-lists

// MARK: - Solution
// ================
class Solution {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA
        var b = headB
        
        while a !== b {
            a = a == nil ? headB : a?.next
            b = b == nil ? headA : b?.next
        }
        
        return a
    }
}

class Solution1 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var stackA = [ListNode]()
        var stackB = [ListNode]()
        
        var pointerA = headA
        while let node = pointerA {
            stackA.append(node)
            pointerA = pointerA?.next
        }
        
        var pointerB = headB
        while let node = pointerB {
            stackB.append(node)
            pointerB = pointerB?.next
        }
        
        
        var intersectinNode: ListNode?
        while let nodeA = stackA.popLast(), let nodeB = stackB.popLast() {
            if nodeA === nodeB {
                intersectinNode = nodeA
            }
        }
        
        return intersectinNode
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
// Time Complexity: O(n + m)
// Space Complexity: O(n + m)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    let s1 = Solution1()
    
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        let common: ListNode = [8, 4, 5]
        let listA = ListNode(4, ListNode(1, common))
        let listB = ListNode(5, ListNode(6, ListNode(1, common)))
        XCTAssertEqual(s.getIntersectionNode(listA, listB), common)
        XCTAssertEqual(s1.getIntersectionNode(listA, listB), common)
    }
    
    func testLeetCodeExample2() {
        let common: ListNode = [2, 4]
        let listA = ListNode(1, ListNode(9, ListNode(1, common)))
        let listB = ListNode(3, common)
        XCTAssertEqual(s.getIntersectionNode(listA, listB), common)
        XCTAssertEqual(s1.getIntersectionNode(listA, listB), common)
    }
    
    func testLeetCodeExample3() {
        XCTAssertNil(s.getIntersectionNode([2, 6, 4], [1, 5]))
        XCTAssertNil(s1.getIntersectionNode([2, 6, 4], [1, 5]))
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertNil(s.getIntersectionNode(ListNode(1), ListNode(1)))
        XCTAssertNil(s1.getIntersectionNode(ListNode(1), ListNode(1)))
        
        let node = ListNode(1)
        XCTAssertEqual(s.getIntersectionNode(node, node), node)
        XCTAssertEqual(s1.getIntersectionNode(node, node), node)
    }
}

Tests.defaultTestSuite.run()
