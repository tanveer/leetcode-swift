import Foundation

// 226. Invert Binary Tree
// https://leetcode.com/problems/invert-binary-tree

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

// MARK: - Solution
// ================
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return root }
        let curr = root
        let right = curr?.right
        curr?.right = invertTree(curr?.left)
        curr?.left = invertTree(right)
        return root
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
    func testLeetCodeExample() {
        let input = TreeNode(
            4,
            TreeNode(
                2,
                TreeNode(1),
                TreeNode(3)
            ),
            TreeNode(
                7,
                TreeNode(6),
                TreeNode(9)
            )
        )

        let expected = TreeNode(
            4,
            TreeNode(
                7,
                TreeNode(9),
                TreeNode(6)
            ),
            TreeNode(
                2,
                TreeNode(3),
                TreeNode(1)
            )
        )

        let inverted = s.invertTree(input)
        XCTAssertEqual(inverted, expected)
    }
}

Tests.defaultTestSuite.run()

