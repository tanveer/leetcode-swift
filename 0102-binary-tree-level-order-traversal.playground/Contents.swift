import Foundation

// 102. Binary Tree Level Order Traversal
// https://leetcode.com/problems/binary-tree-level-order-traversal

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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()

        if root == nil {
            return result
        }

        var queue = [TreeNode?](arrayLiteral: root)

        while !queue.isEmpty {
            var count = queue.count
            var rows = [Int]()

            while count > 0 {
                let node = queue.removeFirst()
                rows.append(node!.val)
                if node?.left != nil { queue.append(node?.left) }
                if node?.right != nil { queue.append(node?.right) }
                count -= 1
            }
            result.append(rows)
        }
        return result
    }
}

// Recursive
class Solution2 {
    var result = [[Int]]()

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        traverse(root, 0)
        return result
    }

    func traverse(_ root: TreeNode?, _ height: Int) {
        guard let val = root?.val else { return }

        if result.count == height {
            result.append([val])
        } else {
            result[height].append(val)
        }
        traverse(root?.left, height + 1)
        traverse(root?.right, height + 1)
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: O(n)
// Space Complexity: O(h)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetcodeExample() {
        let tree: TreeNode = [3, 9, 20, nil, nil, 15, 7]
        let expected = [[3], [9, 20], [15, 7]]
        XCTAssertEqual(s.levelOrder(tree), expected)
        XCTAssertEqual(s2.levelOrder(tree), expected)
    }
}

Tests.defaultTestSuite.run()
