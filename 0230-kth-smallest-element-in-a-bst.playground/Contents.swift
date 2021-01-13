import Foundation

// 230. Kth Smallest Element in a BST
// https://leetcode.com/problems/kth-smallest-element-in-a-bst

// MARK: - Solution
// ================
class Solution {
    var smallest = 0
    var result = 0

    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        smallest = k
        findSmallest(root)
        return result
    }

    func findSmallest(_ root: TreeNode?) {
        guard let root = root else { return }
        findSmallest(root.left)
        smallest -= 1
        if smallest == 0 {
            result = root.val
            return
        }
        findSmallest(root.right)
    }
}

class Solution2 {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        return inorderTraversal(root)[k - 1]
    }

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var res = [Int]()

        if root.left != nil {
            res += inorderTraversal(root.left)
        }

        res.append(root.val)

        if root.right != nil {
            res += inorderTraversal(root.right)
        }

        return res
    }

    func kthSmallest_iterative(_ root: TreeNode?, _ k: Int) -> Int {
        var current = root

        var stack = [TreeNode]()

        var i = 0
        while current != nil || !stack.isEmpty {
            while let currentNode = current {
                stack.append(currentNode)
                current = currentNode.left
            }

            let node = stack.removeLast()

            i += 1
            if i == k {
                return node.val
            }
            current = node.right
        }

        return 0
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
// Time Complexity: O(n)
// Space Complexity: O(n)

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()
    let s2 = Solution2()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.kthSmallest([3, 1, 4, nil, 2], 1), 1)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.kthSmallest([5, 3, 6, 2, 4, nil, nil, 1], 3), 3)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s2.kthSmallest([5, 3, 6, 2, 4, nil, nil, 1], 3), 3)
    }

    func testLeetCodeExample4() {
        XCTAssertEqual(s2.kthSmallest_iterative([3, 1, 4, nil, 2], 1), 1)
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.kthSmallest([5], 1), 5)
    }
}

Tests.defaultTestSuite.run()
