import Foundation

// 671. Second Minimum Node In a Binary Tree
// https://leetcode.com/problems/second-minimum-node-in-a-binary-tree

// MARK: - Solution
// ================

class Solution {
    func findSecondMinimumValue(_ root: TreeNode?) -> Int {
        guard let root = root else { return -1 }
        return minimumValue(root, root.val) < Int.max ? minimumValue(root, root.val) : -1
    }

    func minimumValue(_ root: TreeNode, _ val: Int) -> Int {
        if root.val > val {
            return root.val
        }

        if let left = root.left, let right = root.right {
            return min(minimumValue(left, val), minimumValue(right, val))
        }

        return Int.max
    }
}

// Definition for a binary tree node.
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

        var queueArray: [TreeNode] = [self]
        var valuesToAdd = Array(arrayLiteral.dropFirst())

        while !queueArray.isEmpty && !valuesToAdd.isEmpty {
            let node = queueArray.removeFirst()

            if let leftVal = valuesToAdd.removeFirst() {
                node.left = TreeNode(leftVal)
                queueArray.append(node.left!)
            }

            guard !valuesToAdd.isEmpty else { return }
            if let rightVal = valuesToAdd.removeFirst() {
                node.right = TreeNode(rightVal)
                queueArray.append(node.right!)
            }
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
// Time Complexity: O(n)
// Space Complexity: O(1)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.findSecondMinimumValue([2, 2, 5, nil, nil, 5, 7]), 5)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.findSecondMinimumValue([2, 2, 2]), -1)
    }
}

Tests.defaultTestSuite.run()
