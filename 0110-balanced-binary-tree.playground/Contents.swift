import Foundation

// 110. Balanced Binary Tree
// https://leetcode.com/problems/balanced-binary-tree

// MARK: - Solution
// ================
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard root != nil else { return false }
        return getHeight(root) != -1
    }

    func getHeight(_ node: TreeNode?) -> Int {
        guard let node = node else {
            return 0
        }

        let left = getHeight(node.left)
        let right = getHeight(node.right)

        if left == -1 || right == -1 || abs(left - right) > 1 {
            return -1
        }

        return max(left, right) + 1 // add 1 to toal height
    }
}

// MARK: - Supporting Code: Definition for a binary tree node
// ==========================================================
public class TreeNode: ExpressibleByArrayLiteral, ExpressibleByIntegerLiteral, Equatable {
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

    // ExpressibleByIntegerLiteral
    // Allow left and right leaves to be specified as integers, i.e. TreeNode(1, 2, 3) vs TreeNode(1, TreeNode(2), TreeNode(3))
    public required convenience init(integerLiteral value: Int) {
        self.init(value)
    }

    // ExpressibleByArrayLiteral
    // Allow initialization as: let treeNode: TreeNode = [1, 2, 3]
    public required convenience init(arrayLiteral: Int?...) {
        guard let firstVal = arrayLiteral.first else { fatalError("Cannot be used on empty arrays since they should represent nil") }
        guard let rootNodeVal = firstVal else { fatalError("Root node's value cannot be nil") }
        self.init(rootNodeVal)

        var queueArray: [TreeNode] = [self]
        var valuesToAdd = Array(arrayLiteral.dropFirst())

        while !queueArray.isEmpty, !valuesToAdd.isEmpty {
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

    // Equatable
    // This is to allow XCTAssertEqual to compare two TreeNodes
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
// Space Complexity: O(h) where h is height of the tree


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.isBalanced([3, 9, 20, nil, nil, 15, 7]))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.isBalanced([1, 2, 2, 3, 3, nil, nil, 4, 4]))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s.isBalanced(nil))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertFalse(s.isBalanced(nil))
    }
}

Tests.defaultTestSuite.run()
