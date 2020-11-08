
import Foundation

// 235. Lowest Common Ancestor of a Binary Search Tree
// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree

// MARK: - Solution
// ================

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

        while !queueArray.isEmpty && !valuesToAdd.isEmpty {
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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }

        let pValue = p.val
        let qValue = q.val
        var node: TreeNode? = root

        while let current = node {
            let currentVal = current.val

            if pValue < currentVal && qValue < currentVal {
                node = current.left
            } else if pValue > currentVal && qValue > currentVal {
                node = current.right
            } else {
                return current
            }
        }

        return node
    }

    func lowestCommonAncestor_recursive(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p = p, let q = q else { return nil }

        let pVal = p.val
        let qVal = q.val
        let rootVal = root.val

        if pVal < rootVal && qVal < rootVal {
            return lowestCommonAncestor_recursive(root.left, p, q)
        } else if pVal > rootVal && qVal > rootVal {
            return lowestCommonAncestor_recursive(root.right, p, q)
        } else {
            return root
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
        let root: TreeNode = [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5]
        let ancestor = s.lowestCommonAncestor(root, root.left, root.right)
        XCTAssertEqual(ancestor, root)
    }

    func testLeetCodeExample2() {
        let root: TreeNode = [6, 2, 8, 0, 4, 7, 9, nil, nil, 3, 5]
        let ancestor = s.lowestCommonAncestor_recursive(root, root.left, root.left?.right)
        XCTAssertEqual(ancestor, root.left)
    }

    // Additional Examples
    func testAdditionalExamples() {
        let root: TreeNode = [1, 2, 3]
        let ancestor = s.lowestCommonAncestor(root, root, root)
        XCTAssertEqual(ancestor, root)
    }
}

Tests.defaultTestSuite.run()
