import Foundation

// 559. Maximum Depth of N-ary Tree
// https://leetcode.com/problems/maximum-depth-of-n-ary-tree

// MARK: - Solution
// ================

// Definition for a Node.
public class Node {
    public var val: Int
    public var children: [Node]
    
    public init(_ val: Int, children: [Node] = []) {
        self.val = val
        self.children = children
    }
}

class Solution {
    func maxDepth(_ root: Node?) -> Int {
        guard let root = root else { return 0 }
        
        var depth = 0
        var queue = [Node]()
        queue.append(root)
        
        while !queue.isEmpty {
            depth += 1
            
            var childeren = [Node]()
            for parent in queue {
                childeren.append(contentsOf: parent.children)
            }
            
            queue = childeren
        }
        
        return depth
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
        let tree = Node(1, children: [
            Node(3, children: [
                Node(5),
                Node(6),
            ]),
            Node(2),
            Node(4),
        ])
        
        XCTAssertEqual(s.maxDepth(tree), 3)
    }
    
    func testLeetCodeExample2() {
        let tree = Node(1, children: [
            Node(2),
            Node(3, children: [
                Node(6),
                Node(7, children: [
                    Node(11, children: [
                        Node(14),
                    ]),
                ]),
            ]),
            Node(4, children: [
                Node(8, children: [
                    Node(12),
                ]),
            ]),
            Node(5, children: [
                Node(9, children: [
                    Node(13),
                ]),
                Node(10),
            ]),
        ])
        
        XCTAssertEqual(s.maxDepth(tree), 5)
    }
    
    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.maxDepth(nil), 0)
        XCTAssertEqual(s.maxDepth(Node(1)), 1)
    }
}

Tests.defaultTestSuite.run()
