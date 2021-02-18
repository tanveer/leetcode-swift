import Foundation

// 116. Populating Next Right Pointers in Each Node
// https://leetcode.com/problems/populating-next-right-pointers-in-each-node

// MARK: - Solution
// ================
class Solution {
    func connect(_ root: Node?) -> Node? {
        guard root != nil else { return nil }
        var queue:[Node?] = [root]
        queue.append(nil)

        while !queue.isEmpty {
            let current = queue.removeFirst()
            if current == nil && queue.isEmpty {
                return root
            } else if current == nil {
                queue.append(nil)
                continue
            } else {
                current?.next = queue.first ?? nil
                if current?.left != nil {
                    queue.append(current?.left)
                }
                if current?.right != nil {
                    queue.append(current?.right)
                }
            }
        }
        return root
    }
}


// Definition for a Node.
// Definition for a binary tree node.
public class Node: ExpressibleByArrayLiteral, ExpressibleByIntegerLiteral {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public var next: Node?

    public init() { self.val = 0; self.left = nil; self.right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
    public init(_ val: Int, _ left: Node?, _ right: Node?) {
        self.val = val
        self.left = left
        self.right = right
    }

    // Allow left and right leaves to be specified as integers, i.e. TreeNode(1, 2, 3) vs TreeNode(1, TreeNode(2), TreeNode(3))
    public required convenience init(integerLiteral value: Int) {
        self.init(value)
    }

    // Allow initialization as: let treeNode: TreeNode = [1, 2, 3]
    public required convenience init(arrayLiteral: Int?...) {
        guard let firstVal = arrayLiteral.first else { fatalError("Cannot be used on empty arrays since they should represent nil") }
        guard let rootNodeVal = firstVal else { fatalError("Root node's value cannot be nil") }
        self.init(rootNodeVal)

        var queueArray: [Node] = [self]
        var valuesToAdd = Array(arrayLiteral.dropFirst())

        while !queueArray.isEmpty, !valuesToAdd.isEmpty {
            let node = queueArray.removeFirst()

            if let leftVal = valuesToAdd.removeFirst() {
                node.left = Node(leftVal)
                queueArray.append(node.left!)
            }

            guard !valuesToAdd.isEmpty else { return }
            if let rightVal = valuesToAdd.removeFirst() {
                node.right = Node(rightVal)
                queueArray.append(node.right!)
            }
        }
    }
}

// This is to allow XCTAssertEqual to compare two TreeNodes
extension Node: Equatable {
    public static func == (lhs: Node, rhs: Node) -> Bool {
        return isSameTree(lhs, rhs)
    }

    static func isSameTree(_ p: Node?, _ q: Node?) -> Bool {
        if p == nil, q == nil {
            return true
        } else if p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        } else {
            return false
        }
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
        let node4 = Node(4)
        let node5 = Node(5)
        let node2 = Node(2, node4, node5)

        let node6 = Node(6)
        let node7 = Node(7)
        let node3 = Node(3, node6, node7)

        let node1 = Node(1, node2, node3)

        s.connect(node1)

        XCTAssertNil(node1.next)
        XCTAssertNil(node3.next)
        XCTAssertNil(node7.next)

        XCTAssertEqual(node2.next, node3)

        XCTAssertEqual(node4.next, node5)
        XCTAssertEqual(node5.next, node6)
        XCTAssertEqual(node6.next, node7)
    }

    // Additional Examples
    func testAdditionalExamples() {
        // Note: This is an example of a binary tree that is not perfect, but the question only asks for it to work on perfect trees
        // The level order method should work both ways
        // https://backtobackswe.com/platform/content/populating-level-pointers
        let node4 = Node(4)
        let node2 = Node(2, node4, nil)

        let node7 = Node(7)
        let node3 = Node(3, nil, node7)

        let node1 = Node(1, node2, node3)

        s.connect(node1)

        XCTAssertNil(node1.next)
        XCTAssertNil(node7.next)
        XCTAssertNil(node3.next)

        XCTAssertEqual(node2.next, node3)

        XCTAssertEqual(node4.next, node7)
    }
}

Tests.defaultTestSuite.run()
