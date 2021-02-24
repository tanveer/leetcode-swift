import Foundation

// 872. Leaf-Similar Trees
// https://leetcode.com/problems/leaf-similar-trees

// MARK: - Solution
// ================
class Solution {
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var leavsVal1 = [Int]()
        var leavsVal2 = [Int]()
        dfs(root1, &leavsVal1)
        dfs(root2, &leavsVal2)

        if leavsVal1.count == leavsVal2.count {
            for i in 0..<leavsVal1.count where leavsVal1[i] != leavsVal2[i] {
                return false
            }
            return true
        }

        return false
    }

    func dfs(_ root: TreeNode?, _ leavs: inout [Int]) {
        guard let root = root else { return }

        if root.left == nil && root.right == nil {
            leavs.append(root.val)
        }

        dfs(root.left, &leavs)
        dfs(root.right, &leavs)
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
// Time Complexity: O(n + m)
// Space Complexity: O(n + m)


// MARK: - Tests
// =============
import XCTest
class Tests: XCTestCase {
    let s = Solution()

    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertTrue(s.leafSimilar([3, 5, 1, 6, 2, 9, 8, nil, nil, 7, 4], [3, 5, 1, 6, 7, 4, 2, nil, nil, nil, nil, nil, nil, 9, 8]))
    }

    func testLeetCodeExample2() {
        XCTAssertTrue(s.leafSimilar([1], [1]))
    }

    func testLeetCodeExample3() {
        XCTAssertFalse(s.leafSimilar([1], [2]))
    }

    func testLeetCodeExample4() {
        XCTAssertTrue(s.leafSimilar([1, 2], [2, 2]))
    }

    func testLeetCodeExample5() {
        XCTAssertFalse(s.leafSimilar([1, 2, 3], [1, 3, 2]))
    }
}

Tests.defaultTestSuite.run()
