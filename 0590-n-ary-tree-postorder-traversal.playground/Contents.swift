import Foundation

// 590. N-ary Tree Postorder Traversal
// https://leetcode.com/problems/n-ary-tree-postorder-traversal

// MARK: - Solution
// ================
class Solution {
    func postorder(_ root: Node?) -> [Int] {
        var result = [Int]()

        func preorderTreversal(_ root: Node?) {
            guard let root = root else { return }
            for child in root.children {
                preorderTreversal(child)
            }
            result.append(root.val)
        }
        preorderTreversal(root)
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
// Time Complexity: O(n)
// Space Complexity: O(n)

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

        XCTAssertEqual(s.postorder(tree), [5,6,3,2,4,1])
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

        XCTAssertEqual(s.postorder(tree), [2,6,14,11,7,3,12,8,4,13,9,10,5,1])
    }
}

Tests.defaultTestSuite.run()

