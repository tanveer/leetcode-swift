//
//  0021-merge-two-sorted-list.swift
//  
//
//  Created by Tanveer Bashir on 10/6/20.
//

import Foundation
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var mergedHead = ListNode(Int.min)
        var current: ListNode? = mergedHead
        var l1 = l1
        var l2 = l2

        while let node1 = l1, let node2 = l2 {
            if node1.val < node2.val {
                current?.next = node1
                l1 = node1.next
            } else {
                current?.next = node2
                l2 = node2.next
            }
            current = current?.next
        }

        if l1 != nil {
            current?.next = l1
        } else if l2 != nil {
            current?.next = l2
        }
        return mergedHead.next
    }
}
