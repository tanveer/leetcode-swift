import Foundation

// 589. N-ary Tree Preorder Traversal
// https://leetcode.com/problems/n-ary-tree-preorder-traversal

// MARK: - Solution
// ================
class Solution {
    func preorder(_ root: Node?) -> [Int] {
        var result = [Int]()

        func preorderTreversal(_ root: Node?) {
            guard let root = root else { return }
            result.append(root.val)
            for child in root.children {
                preorderTreversal(child)
            }
        }
        preorderTreversal(root)
        return result
    }

    func preorder_iterative(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int]()

        var stack = [root]

        while !stack.isEmpty {
            let node = stack.removeLast()
            result.append(node.val)
            for child in node.children.reversed() {
                stack.append(child)
            }
        }

        return result
    }
}

// Definition for a Node.
public class Node {
    public var val: Int
    public var children: [Node]

    public init(_ val: Int, children: [Node] = []) {
        self.val = val
        self.children = children
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
        let tree = Node(1, children: [
            Node(3, children: [
                Node(5),
                Node(6),
            ]),
            Node(2),
            Node(4),
        ])

        XCTAssertEqual(s.preorder(tree), [1, 3, 5, 6, 2, 4])
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

        XCTAssertEqual(s.preorder(tree), [1, 2, 3, 6, 7, 11, 14, 4, 8, 12, 5, 9, 13, 10])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.preorder(nil), [])
        XCTAssertEqual(s.preorder(Node(1)), [1])
    }
}

Tests.defaultTestSuite.run()


