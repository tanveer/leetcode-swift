import Foundation

// 637. Average of Levels in Binary Tree
// https://leetcode.com/problems/average-of-levels-in-binary-tree

// MARK: - Solution
// ================
class Solution {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return [] }
        var queue = [TreeNode]()
        var result = [Double]()
        queue.append(root)

        while !queue.isEmpty {
            var sum = 0
            let count = queue.count

            for _ in 0..<count {
                let node = queue.removeFirst()
                sum += node.val
                if node.left != nil { queue.append(node.left!) }
                if node.right != nil { queue.append(node.right!) }
            }

            let average = Double(sum) / Double(count)
            result.append(average)
        }

        return result
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
        let tree = TreeNode(
            3,
            TreeNode(
                9
            ),
            TreeNode(
                20,
                TreeNode(15),
                TreeNode(7)
            )
        )
        XCTAssertEqual(s.averageOfLevels(tree), [3, 14.5, 11])
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertEqual(s.averageOfLevels(TreeNode(1, TreeNode(2), TreeNode(3))), [1, 2.5])
    }
}

Tests.defaultTestSuite.run()
