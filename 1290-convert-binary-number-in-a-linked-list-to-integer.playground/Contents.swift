import Foundation

// 1290. Convert Binary Number in a Linked List to Integer
// https://leetcode.com/problems/convert-binary-number-in-a-linked-list-to-integer

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

class Solution {
    func getDecimalValue(_ head: ListNode?) -> Int {
        guard let curr = head else { return 0 }
        var num = curr.val
        
        while let next = curr.next {
            num = (num << 1) | next.val
            curr.next = next.next
        }
        return num
    }
}


// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n) // since iterating over every node in linked list
// Space Complexity: O(1)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    
    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.getDecimalValue([1, 0, 1]), 5)
    }
    
    func testLeetCodeExample2() {
        XCTAssertEqual(s.getDecimalValue([0]), 0)
    }
    
    func testLeetCodeExample3() {
        XCTAssertEqual(s.getDecimalValue([1]), 1)
    }
    
    func testLeetCodeExample4() {
        XCTAssertEqual(s.getDecimalValue([1, 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0]), 18880)
    }
    
    func testLeetCodeExample5() {
        XCTAssertEqual(s.getDecimalValue([0, 0]), 0)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.getDecimalValue(nil), 0)
    }
}

Tests.defaultTestSuite.run()

