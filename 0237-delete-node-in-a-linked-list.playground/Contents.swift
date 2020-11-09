
import Foundation

// 237. Delete Node in a Linked List
// https://leetcode.com/problems/delete-node-in-a-linked-list

// MARK: - Solution
// ================
class Solution {
    func deleteNode(_ node: ListNode?) {
        guard let node = node else { return }
        let next = node.next!
        
        node.val = next.val
        node.next = next.next
        next.next = nil
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
// Time Complexity: O(1)
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        let list: ListNode = [4, 5, 1, 9]
        s.deleteNode(list.next)
        XCTAssertEqual(list, [4, 1, 9])
    }
    
    func testLeetCodeExample2() {
        let list: ListNode = [4, 5, 1, 9]
        s.deleteNode(list.next?.next)
        XCTAssertEqual(list, [4, 5, 9])
    }
    
    func testLeetCodeExample3() {
        let list: ListNode = [1, 2, 3, 4]
        s.deleteNode(list.next?.next)
        XCTAssertEqual(list, [1, 2, 4])
    }
    
    func testLeetCodeExample4() {
        let list: ListNode = [0, 1]
        s.deleteNode(list)
        XCTAssertEqual(list, [1])
    }
    
    func testLeetCodeExample5() {
        let list: ListNode = [-3, 5, -99]
        s.deleteNode(list)
        XCTAssertEqual(list, [5, -99])
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        let list: ListNode = [0, 0]
        s.deleteNode(list)
        XCTAssertEqual(list, [0])
    }
}

Tests.defaultTestSuite.run()
