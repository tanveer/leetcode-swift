import Foundation

// 971. Flip Binary Tree To Match Preorder Traversal
// https://leetcode.com/problems/flip-binary-tree-to-match-preorder-traversal

// MARK: - Solution
// ================
class Solution {
    var index = 0
    var output = [Int]()
    var voyage: [Int] = []

    func flipMatchVoyage(_ root: TreeNode?, _ voyage: [Int]) -> [Int] {
        guard root != nil else { return [-1] }
        self.voyage = voyage

        return dfs(root) ? output : [-1]
    }

    func dfs(_ node: TreeNode?) -> Bool {
        guard let node = node else { return true }

        if node.val != self.voyage[index] {
            return false
        }
        index += 1

        if node.left != nil, node.left?.val != self.voyage[index] {
            output.append(node.val)
            return dfs(node.right) && dfs(node.left)
        } else {
            return dfs(node.left) && dfs(node.right)
        }
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
// Space Complexity: O(n)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.flipMatchVoyage([1, 2], [2, 1]), [-1])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.flipMatchVoyage([1, 2, 3], [1, 3, 2]), [1])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.flipMatchVoyage([1, 2, 3], [1, 2, 3]), [])
    }
}

Tests.defaultTestSuite.run()
