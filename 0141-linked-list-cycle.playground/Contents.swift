    import Foundation

    // 141. Linked List Cycle
    // https://leetcode.com/problems/linked-list-cycle

    // MARK: - Solution
    // ================

    // Definition for singly-linked list.
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int, _ next: ListNode? = nil) {
            self.val = val
            self.next = next
        }
    }

    class Solution {
        func hasCycle(_ head: ListNode?) -> Bool {
            guard head != nil else { return false }
            
            var curr = head
            var nextNode = head?.next
            
            while curr !== nextNode {
                if curr == nil || nextNode == nil {
                    return false
                }
                
                curr = curr?.next
                nextNode = nextNode?.next?.next
            }
            
            return true
        }
    }

    // MARK: - Time and Space Complexity
    // =================================
    // Time Complexity: O(__REPLACE_ME__)
    // Space Complexity: O(__REPLACE_ME__)


    // MARK: - Tests
    // =============
    import XCTest
    class Tests: XCTestCase {
        let s = Solution()
        
        // LeetCode Examples
        func testLeetCodeExample1() {
            let last = ListNode(4)
            let second = ListNode(2, ListNode(0, last))
            let head = ListNode(3, second)
            last.next = second
            XCTAssertTrue(s.hasCycle(head))
        }
        
        func testLeetCodeExample2() {
            let tail = ListNode(2)
            let head = ListNode(1, tail)
            tail.next = head
            XCTAssertTrue(s.hasCycle(head))
        }
        
        func testLeetCodeExample3() {
            XCTAssertFalse(s.hasCycle(ListNode(1)))
        }
        
        // Additional Examples
        func testAdditionalExamples() {
            XCTAssertFalse(s.hasCycle(nil))
        }
    }

    Tests.defaultTestSuite.run()
