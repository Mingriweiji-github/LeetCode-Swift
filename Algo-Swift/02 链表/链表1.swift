//
//  LinkedListAlgo.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/9.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation

/*定义一个链表：Definition for singly-linked list.*/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0;
        self.next = nil;
    }
    public init(_ val: Int) {
        self.val = val;
        self.next = nil;
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val;
        self.next = next;
    }
}

/** 链表 10
1) 删除链表中的节点
2) 反转链表
3) 反转链表 II
4、 环形链表 & 环形链表II
5、合并两个有序的链表
6、 删除链表倒数第n个结点
7、求链表的中间结点
8、两数相加 Meidum
9、两数相加 II Medium
10、环形链表 Easy
10、环形链表 II Medium
*/


// 1、删除链表中的节点
func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
    guard  head != nil else { return head }
    //虚拟头结点
    let dummy = ListNode(0)
    dummy.next = head
    //遍历节点, 命中节点，删除, 没有命中，指针p后移
    var p = dummy
    while p.next != nil {
        if p.next?.val == val {
            p.next = p.next?.next
        } else {
            p = p.next!
        }
    }
    return dummy.next
}
// 1、单链表翻转
/*
  反转链表:双指针法
  - 定义两个指针pre、cur: pre在前 cur在后
  - 每次pre.next指向cur实现一次翻转
  - 翻转后 pre、cur同步向前一步
  - 循环终止条件是pre为空
 */
func reverseList(_ head: ListNode?) -> ListNode? {
    
    
    
    if head == nil || head?.next == nil { return head }
    var pre = head,cur: ListNode?
    while pre != nil {
        let temp = pre?.next
        pre?.next = cur
        cur = pre
        pre = temp
    }
    return cur
}
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



///3、合并两个有序的链表
/*
 解题思路：使用虚拟头结点dummyHead、cur.next记录当前的dummyHead
 */
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var l1 = l1, l2 = l2
    let dummyHead = ListNode(-1)
    var cur = dummyHead
    while l1 != nil && l2 != nil {
        if l1!.val >= l2!.val {
            cur.next = l2
            l2 = l2?.next
        } else {
            cur.next = l1
            l1 = l1?.next
        }
        cur = cur.next!
    }
    //当出现l1或l2为空链表时，确定cur.next
    cur.next = l1 == nil ? l2 : l1

    return dummyHead.next
}

/*
 4、删除链表倒数第n个结点
 解题思路：
 a: 两个指针fast,slow间隔为n同时每次移动一步
 b: 当fast为空，记录并删除slow的位置
 */
func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    //使用虚拟头结点
    let dummyHead = ListNode(-1)
    dummyHead.next = head
    var fast: ListNode? = dummyHead, slow: ListNode? = dummyHead
    //fast先走N步
    for _ in 0..<n {
        fast = fast?.next
    }
    //fast、slow同步走
    while fast?.next != nil  {
        fast = fast?.next!
        slow = slow?.next!
    }
    //fast走完链表指向尾部，此时fast slow刚好相差为N,slow.next是我们要删除的节点
    slow?.next = slow?.next?.next
    return dummyHead.next
}
/*
5、求链表的中间节点
解题思路：
a: 两个指针fast,slow
b: fast每次走两步，slow每次走一步
c: 当fast到达链表尾部时，slow就是中间节点
*/
func middleNode(_ head: ListNode?) -> ListNode? {
    var fast: ListNode? = head
    var slow: ListNode? = head
    while fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    return slow
}

// 10、环形链表
/**
 1、双指针fast=head.nex low=head
 2、fast每次走两步 low每次走一步
 3、如果fast和low相遇说明有环，当fast为空时跳出循环
 */
func hasCircle(_ head: ListNode?) -> Bool {

    var fast = head?.next, slow = head
    while fast != nil {
        if fast === slow { return true }
        fast = fast?.next?.next
        slow = slow!.next
    }

    return false
}
// 2、环形链表II 寻找环入口位置下标
/**
 f = 2s f = s + nb
 -> s = nb,f=2nb,
 -> f = k = a + nb
 当fast/slow第一次相遇后，讲fast指向head 重新开始,slow此时即为
 */
func detectCycle(_ head: ListNode?, _ pos: Int) -> ListNode? {
      if head == nil || head?.next == nil { return head }
      var fast = head?.next, slow = head
      while fast != nil {
          fast = fast?.next?.next
          slow = slow?.next
          if fast === slow { ///第一次相遇
              fast = head
              while fast !== slow {
                  fast = fast?.next
                  slow = slow?.next
              }
              return slow
          }
      }
      return nil
}
