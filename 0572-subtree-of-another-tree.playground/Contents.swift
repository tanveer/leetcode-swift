import Foundation

// 572. Subtree of Another Tree
// https://leetcode.com/problems/subtree-of-another-tree

// MARK: - Solution
// ================
class Solution {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil {
            return false
        } else if isSameTree(s, t) {
            return true
        } else {
            return isSubtree(s?.left, t) || isSubtree(s?.right, t)
        }
    }

    func isSameTree(_ a: TreeNode?, _ b: TreeNode?) -> Bool {
        if a == nil || b == nil {
            return a == nil && b == nil
        } else if a?.val == b?.val {
            return isSameTree(a?.left, b?.left) && isSameTree(a?.right, b?.right)
        } else {
            return false
        }
    }
}

// Definition for a binary tree node.
public class TreeNode: ExpressibleByArrayLiteral, ExpressibleByIntegerLiteral {
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

    public required convenience init(integerLiteral value: Int) {
        self.init(value)
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

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n x m)
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        let tree1 = TreeNode(3, TreeNode(4, 1, 2), 5)
        let tree2 = TreeNode(4, 1, 2)
        XCTAssertTrue(s.isSubtree(tree1, tree2))
    }

    func testLeetCodeExample2() {
        let tree1 = TreeNode(3, TreeNode(4, 1, TreeNode(2, 0, nil)), 5)
        let tree2 = TreeNode(4, 1, 2)
        XCTAssertFalse(s.isSubtree(tree1, tree2))
    }

    // Additional Examples
    func testAdditionalExamples() {
        let tree1 = TreeNode(1, 2, 3)
        let tree2 = TreeNode(1, 2, 3)
        XCTAssertTrue(s.isSubtree(tree1, tree2))
    }
}

Tests.defaultTestSuite.run()
