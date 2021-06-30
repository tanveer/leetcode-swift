import Foundation

// 270. Closest Binary Search Tree Value
// https://leetcode.com/problems/closest-binary-search-tree-value

// MARK: - Solution
// ================
class Solution {
    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard root != nil else { return 0 }
        var nums = [Int]()
        dfs(root, &nums)
        var output = 0
        var minDifference = Double(Int.max)

        for num in nums {
            let difference = abs(target - Double(num))
            if difference < minDifference {
                minDifference = difference
                output = num
            }
        }

        return output
    }

    // Inorder
    func dfs(_ root: TreeNode?, _ nums: inout [Int]) {
        guard let root = root else { return }
        dfs(root.left, &nums)
        nums.append(root.val)
        dfs(root.right, &nums)
    }
}


class Solution1 {
    private(set) var minDifference = Double(Int.max)
    private(set) var output = 0

    func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
        guard root != nil  else { return 0 }
        var root = root

        while root != nil {
            let difference = abs(Double(root!.val) - target)
            if difference < minDifference {
                minDifference = difference
                output = root?.val ?? 0
            }
            root = target < Double(output) ? root?.left : root?.right
        }
        return output
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
    let s1 = Solution1()


    // LeetCode Examples
    func testLeetCodeExample1() {
        XCTAssertEqual(s.closestValue([4, 2, 5, 1, 3], 3.714286), 4)
        XCTAssertEqual(s1.closestValue([4, 2, 5, 1, 3], 3.714286), 4)
    }

    func testLeetCodeExample2() {
        XCTAssertEqual(s.closestValue([1], 4.428571), 1)
        XCTAssertEqual(s1.closestValue([1], 4.428571), 1)
    }

    func testLeetCodeExample3() {
        XCTAssertEqual(s.closestValue([1, nil, 2], 3.428571), 2)
        XCTAssertEqual(s1.closestValue([1, nil, 2], 3.428571), 2)
    }
}

Tests.defaultTestSuite.run()
