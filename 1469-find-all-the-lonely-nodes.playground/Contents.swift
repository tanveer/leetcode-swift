import Foundation

// 1469. Find All The Lonely Nodes
// https://leetcode.com/problems/find-all-the-lonely-nodes

// MARK: - Solution
// ================
class Solution {
    var output = [Int]()

    func getLonelyNodes(_ root: TreeNode?) -> [Int] {
        inorder(root)
        return output
    }

    private func inorder(_ root: TreeNode?) {
        guard let root = root else { return }

        inorder(root.left)
        if let left = root.left, root.right == nil {
            output.append(left.val)
        }

        if let right = root.right, root.left == nil {
            output.append(right.val)
        }
        inorder(root.right)
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
        XCTAssertEqual(s.getLonelyNodes([1, 2, 3, nil, 4]), [4])
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.getLonelyNodes([7, 1, 4, 6, nil, 5, 3, nil, nil, nil, nil, nil, 2]), [6, 2])
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.getLonelyNodes([11, 99, 88, 77, nil, nil, 66, 55, nil, nil, 44, 33, nil, nil, 22]), [33, 55, 77, 66, 44, 22])
    }

    func testLeetCodeExample5() {
        XCTAssertEqual(s.getLonelyNodes([31, nil, 78, nil, 28]), [78, 28])
    }
}

Tests.defaultTestSuite.run()
