import Foundation

// 105. Construct Binary Tree from Preorder and Inorder Traversal
// https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal

// MARK: - Solution
// ================
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return helper(0, 0, inorder.count - 1, preorder, inorder)
    }

    func helper(_ preOrderStart: Int, _ inOrderStart: Int, _ inorderEnd: Int, _ preOrder: [Int], _ inOrder: [Int]) -> TreeNode? {
        if preOrderStart > preOrder.count - 1 || inOrderStart > inorderEnd {
            return nil
        }

        let root = TreeNode(preOrder[preOrderStart])
        var inOrderIndex = 0
        for index in inOrderStart...inorderEnd {
            if root.val == inOrder[index] {
                inOrderIndex = index
            }
        }

        root.left = helper(preOrderStart + 1, inOrderStart, inOrderIndex - 1, preOrder, inOrder)
        let preOrderIndex = preOrderStart + inOrderIndex - inOrderStart + 1
        root.right = helper(preOrderIndex, inOrderIndex + 1, inorderEnd, preOrder, inOrder)
        return root
    }
}

// Definition for a binary tree node.
public class TreeNode: ExpressibleByArrayLiteral {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?

    public init() { self.val = 0; self.left = nil; self.right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
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

        while !queueArray.isEmpty, !valuesToAdd.isEmpty {
            let node = queueArray.removeFirst()

            if let leftVal = valuesToAdd.removeFirst() {
                node?.left = TreeNode(leftVal)
            }
            queueArray.append(node?.left)

            guard !valuesToAdd.isEmpty else { return }
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
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        let preorder = [3, 9, 20, 15, 7]
        let inorder = [9, 3, 15, 20, 7]
        XCTAssertEqual(s.buildTree(preorder, inorder), [3, 9, 20, nil, nil, 15, 7])
    }

    // Additional Examples
    func testAdditionalExample1() {
        let preorder = [1, 2, 4, 5, 3, 6, 7]
        let inorder = [4, 2, 5, 1, 6, 3, 7]
        XCTAssertEqual(s.buildTree(preorder, inorder), [1, 2, 3, 4, 5, 6, 7])
    }

    func testAdditionalExample2() {
        let preorder = [4, 2, 1, 3, 6, 5, 7]
        let inorder = [1, 2, 3, 4, 5, 6, 7]
        XCTAssertEqual(s.buildTree(preorder, inorder), [4, 2, 6, 1, 3, 5, 7]) // BST
    }
}

Tests.defaultTestSuite.run()
