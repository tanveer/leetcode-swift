//
//
//  Created by Tanveer Bashir on 10/12/20.
//

// 83. Remove Duplicates from Sorted List
// https://leetcode.com/problems/remove-duplicates-from-sorted-list/

// MARK: - Solution
// ================
class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil { return head }
        var current = head

        while let next = current?.next {
            let val = current?.val ?? 0
            if val == next.val {
                current?.next = next.next
            }
            else {
                current = current?.next
            }
        }
        return head
    }
}

