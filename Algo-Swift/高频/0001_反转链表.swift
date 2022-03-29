//
//  0001_反转链表.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2022/3/30.
//  Copyright © 2022 KM. All rights reserved.
//

import Foundation

class LinkSolution {
    //反转链表递归法： newHead = reversList(head.next)
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return nil }
        let newHead = reverseList2(head?.next)
        head?.next?.next = head
        head?.next = nil
        return newHead
    }
    
    //2、反转链表 II
    // 递归法：首先将链表的前 n 个节点反转（n <= 链表长度）
    func reverseN(_ head: ListNode?, _ n: Int) -> ListNode? {
        //后继节点
        var successor: ListNode?
        if n == 1 {
            successor = head?.next
            return head
        }
        //以head.next为起点，需要遍历前n - 1个节点
        let newHead = reverseN(head?.next, n - 1)
        head?.next?.next = head
        head?.next = successor//// 让反转之后的 head 节点和后面的节点连起来
        return newHead
    }
}
