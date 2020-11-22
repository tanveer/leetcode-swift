import Foundation

// 543. Diameter of Binary Tree
// https://leetcode.com/problems/diameter-of-binary-tree

// MARK: - Solution
// ================
// Definition for a binary tree node.
public class TreeNode: ExpressibleByArrayLiteral {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }

    // Allow initialization as: let treeNode: TreeNode = [1, 2, 3]
    public required convenience init(arrayLiteral: Int?...) {
        guard let firstVal = arrayLiteral.first else { fatalError("Cannot be used on empty arrays since they should represent nil") }
        guard let rootNodeVal = firstVal else { fatalError("Root node's value cannot be nil") }
        self.init(rootNodeVal)

        var queueArray: [TreeNode?] = [self]
        var valuesToAdd = Array(arrayLiteral.dropFirst())

        while !queueArray.isEmpty && !valuesToAdd.isEmpty {
            let node = queueArray.removeFirst()

            if let leftVal = valuesToAdd.removeFirst() {
                node?.left = TreeNode(leftVal)
            }
            queueArray.append(node?.left)

            if valuesToAdd.isEmpty { return }
            if let rightVal = valuesToAdd.removeFirst() {
                node?.right = TreeNode(rightVal)
            }
            queueArray.append(node?.right)
        }
    }
}

// This is to allow XCTAssertEqual to compare two TreeNodes
extension TreeNode: Equatable {
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return isSameTree(lhs, rhs)
    }

    static func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        } else if p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        } else {
            return false
        }
    }
}

class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        var res = 1
        func depth(_ root: TreeNode?) -> Int {
            guard let root = root else { return 0 }

            let left = depth(root.left)
            let right = depth(root.right)
            res = max(res, (left + right + 1))

            return max(left, right) + 1
        }

        depth(root)
        return res - 1
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
    func testLeetcodeExample() {
        let tree = TreeNode(1)
        tree.left = TreeNode(2)
        tree.right = TreeNode(3)
        tree.left?.left = TreeNode(4)
        tree.left?.right = TreeNode(5)

        XCTAssertEqual(s.diameterOfBinaryTree(tree), 3)
    }

    // Additional Examples
    func testAdditionalExamples() {
        let tree = TreeNode(1)
        XCTAssertEqual(s.diameterOfBinaryTree(tree), 0)
    }
}

Tests.defaultTestSuite.run()

