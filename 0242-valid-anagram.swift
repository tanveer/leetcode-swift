//  0242-valid-anagram.swift
//
//
//  Created by Tanveer Bashir on 10/04/20.
//

// 242. Valid Anagram
// https://leetcode.com/problems/palindrome-number

// MARK: - Solution
// ================
class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var lookup = [Character: Int]()
        
        for char in s {
            if let count = lookup[char] {
                lookup[char] = count +  1
            } else {
                lookup[char] = 1
            }
        }
        
        for char in t {
            if let count = lookup[char] {
                if count != 0 {
                    lookup[char] = count - 1
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
}

// MARK: - Time and Space Complexity
// =================================
//
// Time Complexity: O(n)
// Explanation: Checking the size on the input value once
//
// Space Complexity: O(n)
// Explanation:
