import Foundation

// 112. Path Sum
// https://leetcode.com/problems/path-sum

// MARK: - Solution
// ================
class Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }

        if root.left == nil, root.right == nil, (sum - root.val) == 0 {
            return true
        } else {
            return hasPathSum(root.left, sum - root.val) || hasPathSum(root.right, sum - root.val)
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
// Space Complexity: O(log(n))

// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.hasPathSum([5, 4, 8, 11, nil, 13, 4, 7, 2, nil, nil, nil, 1], 22))
    }

    func testLeetCodeExample2() {
        XCTAssertFalse(s.hasPathSum([1, 2, 3], 5))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s.hasPathSum([1, 2], 5))
    }

    // Additional Examples
    func testAdditionalExamples() {
        XCTAssertTrue(s.hasPathSum([1, 2], 3))
        XCTAssertTrue(s.hasPathSum([1], 1))
    }
}

Tests.defaultTestSuite.run()
