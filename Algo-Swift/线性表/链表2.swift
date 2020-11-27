//
//  LeetCodeTop100.swift
//  Algo-Swift
//
//  Created by Seven on 2020/3/7.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/**
 链表系列：
 剑指 Offer 22. 链表中倒数第k个节点
 剑指 Offer 06. 从尾到头打印链表
 剑指 Offer 24. 反转链表
LeetCode top100: https://leetcode-cn.com/problemset/hot-100/
**/

class LinkedListSolution {
    /*
     剑指 Offer 22. 链表中倒数第k个节点 https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/
     示例：给定一个链表: 1->2->3->4->5, 和 k = 2.
     返回链表 4->5.
     */
    func getKthFromEnd(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 临界条件不要忘
        guard head != nil, k > 0 else { return nil }
        
        var fast = head
        var slow = head
        // 第一步快指针先走k步
        for _ in 1..<k {
            fast = fast?.next
        }
        // 第二步慢指针和快指针一起走，直到快指针走到尽头
        while (fast?.next != nil) {
            fast = fast?.next
            slow = slow?.next
        }
        //最后返回slow就是我们要找的倒数第k个节点
        return slow
    }
    
    
    /**
     剑指 Offer 06. 从尾到头打印链表 https://leetcode-cn.com/problems/cong-wei-dao-tou-da-yin-lian-biao-lcof/
     示例 1：
     输入：head = [1,3,2]
     输出：[2,3,1]
     限制：0 <= 链表长度 <= 10000
     **/
    
    // 思路分析：1、链表转成数组 数组倒叙返回

    func reversePrintByArray(_ head: ListNode?) -> [Int] {
        guard head != nil else { return [] }
        //第一步：扫描链表得到长度len
        var length = 0
        var node = head
        while (node != nil) {
            node = node?.next
            length += 1
        }
        //第二步：node从头开始，索引从末尾length-1开始，倒叙插入数组
        node = head
        // 注意: 这里初始化数组的大小才能通过LeetCode测试用例
        // var res = [Int]()
        var res = [Int](repeating:0, count: length)
        var index = length - 1
        while (index >= 0) {
            // 注意顺序，index减一的操作应该放在res赋值之后，保证最后一个index赋值成功
            if let val = node?.val {
                res[index] = val
            }
            node = node?.next
            index -= 1
        }
        return res
    }
    
    // 思路分析：2、使用栈这种数据结构的后进先出的特点来解决我们倒叙输出的问题
    func reversePrintByStack(_ head: ListNode?) -> [Int] {
        guard head != nil else { return [] }
        // 1、使用栈，遍历链表的同时将所有val入栈
        var stack = [Int]()
        var node = head
        while node != nil {
            // 注意下面两句执行顺序
            if let val = node?.val {
                stack.append(val)
            }
            node = node?.next
        }
        //2、借助栈后入先出的特点，出栈的同时将出栈的val加到结果数组res中
        var res = [Int]()
        while stack.count > 0 {
            let lastItem = stack.removeLast()
            res.append(lastItem)
        }
        return res
    }
    
    
    /*
     剑指 Offer 24. 反转链表
     https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/
     示例:

     输入: 1->2->3->4->5->NULL
     输出: 5->4->3->2->1->NULL
      
     限制：0 <= 节点个数 <= 5000
     
     题解：https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/submissions/
     */
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else { return nil }
        // 双指针翻转链表：p 和 q 交换位置
        var p = head
        var q: ListNode?
        while (p != nil) {
            // 1 防止断链，保存head的下一节点
            let temp = p?.next
            // 2 节点反向，指针由指向下一个节点变为指向前一个节点
            p?.next = q
            // 3 记录当前节点q的位置
            q = p
            // 4 将head指针指向下一个节点
            p = temp
        }
        // 5.返回的应该为最后一个节点，因为当前最后一个节点被q指向，所以返回q
        return q
    }
}
