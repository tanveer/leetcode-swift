import Foundation

// 384. Shuffle an Array
// https://leetcode.com/problems/shuffle-an-array

// MARK: - Solution
// ================
class Solution {
    private var nums = [Int]()

    init(_ nums: [Int]) {
        self.nums = nums
    }

    // Resets the array to its original configuration and return it
    func reset() -> [Int] {
        return nums
    }

    // Returns a random shuffled array
    func shuffle() -> [Int] {
        var shuffled = nums
        for i in 0..<nums.count {
            let rand = Int.random(in: 0..<nums.count)
            if rand != i {
                shuffled.swapAt(i, rand)
            }
        }
        return shuffled
    }
}

// MARK: - Time and Space Complexity
// =================================
// Time Complexity: (n)
// Space Complexity: O(n)
