
[LeetCode25 | K个一组翻转链表 ](https://leetcode-cn.com/problems/reverse-nodes-in-k-group/)

一、题目描述
给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

k 是一个正整数，它的值小于或等于链表的长度。

如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

![](https://pic.imgdb.cn/item/62456c1227f86abb2a4d6dd3.jpg)

二、题目解析





#### Swift K个一组翻转链表 

> **62 / 62** 个通过测试用例
>
> 状态：*通过*
>
> 执行用时: **28 ms**
>
> 内存消耗: **14.5 MB**

```swift
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 一开始设置一个虚拟节点，它的值为 -1，它的值可以设置为任何的数，因为我们根本不需要使用它的值
        let dummy = ListNode(-1)

        // 虚拟头节点的下一节点指向 head 节点
        // 如果原链表是  1 -->  2 -->  3
        // 那么加上虚拟头节点就是  -1 -->  1 -->  2 -->  3
        dummy.next = head
        

        // 设置一个指针，指向此时的虚拟节点，pre 表示每次要翻转的链表的头结点的【上一个节点】
        // pre: -1 -->  1 -->  2 -->  3
        var pre: ListNode? = dummy;

        // 设置一个指针，指向此时的虚拟节点，end 表示每次要翻转的链表的尾节点
        // end: -1 -->  1 -->  2 -->  3
        var end:ListNode? = dummy;

        // 通过 while 循环，不断的找到翻转链表的尾部
        while( end?.next != nil){

            // 通过 for 循环，找到【每一组翻转链表的尾部】
            // 由于原链表按照 k 个一组进行划分会可能出现有一组的长度不足 k 个
            // 比如原链表 1 -->  2 -->  3 -->  4 -->  5
            // k = 2，划分了三组 1 -->  2， 3 -->  4， 5
            // 所以得确保 end 不为空才去找它的 next 指针，否则 null.next 会报错
            for _ in 0..<k {
                // end 不断的向后移动，移动 k 次到达【每一组翻转链表的尾部】
                end = end?.next ;
            }

            // 如果发现 end == nil，说明此时翻转的链表的节点数小于 k ，保存原有顺序就行
            if(end == nil){
                // 直接跳出循环，只执行下面的翻转操作
                break;
            }


            // next 表示【待翻转链表区域】里面的第一个节点
            let next = end?.next

            // 【翻转链表区域】的最尾部节点先断开
            end?.next = nil

            // start 表示【翻转链表区域】里面的第一个节点
            let start: ListNode? = pre?.next



            // 【翻转链表区域】的最头部节点和前面断开
            pre?.next = nil;

            // 这个时候，【翻转链表区域】的头节点是 start，尾节点是 end
            // 开始执行【反转链表】操作
            // 原先是 start --> ...--> end
            // 现在变成了 end --> ...--> start

            // 要翻转的链表的头结点的【上一个节点】的 next 指针指向这次翻转的结果
            pre?.next = reverseNode(start);

            // 接下来的操作是在为【待翻转链表区域】的反转做准备

            // 原先是 start --> ...--> end
            // 现在变成了 end --> ...--> start
            // 【翻转链表区域】里面的尾节点的 next 指针指向【待翻转链表区域】里面的第一个节点
            start?.next = next ;

            // 原先是 start --> ...--> end
            // 现在变成了 end --> ...--> start
            // pre 表示每次要翻转的链表的头结点的【上一个节点】
            pre = start;

            // 将 end 重置为【待翻转链表区域】的头结点的上一个节点。
            end = start;
        }
        return dummy.next
    }
    func reverseNode(_ head: ListNode?) -> ListNode? {
        guard let head = head, let next = head.next else {
            return head
        }
        let current = reverseNode(head.next)
        head.next?.next = head
        head.next = nil
        return current
    }
}
```





#### Java K个一组翻转链表 

```swift
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        // 一开始设置一个虚拟节点，它的值为 -1，它的值可以设置为任何的数，因为我们根本不需要使用它的值
        let dummy = ListNode(-1)

        // 虚拟头节点的下一节点指向 head 节点
        // 如果原链表是  1 -->  2 -->  3
        // 那么加上虚拟头节点就是  -1 -->  1 -->  2 -->  3
        dummy.next = head
        

        // 设置一个指针，指向此时的虚拟节点，pre 表示每次要翻转的链表的头结点的【上一个节点】
        // pre: -1 -->  1 -->  2 -->  3
        var pre: ListNode? = dummy;

        // 设置一个指针，指向此时的虚拟节点，end 表示每次要翻转的链表的尾节点
        // end: -1 -->  1 -->  2 -->  3
        var end:ListNode? = dummy;

        // 通过 while 循环，不断的找到翻转链表的尾部
        while( end?.next != nil){

            // 通过 for 循环，找到【每一组翻转链表的尾部】
            // 由于原链表按照 k 个一组进行划分会可能出现有一组的长度不足 k 个
            // 比如原链表 1 -->  2 -->  3 -->  4 -->  5
            // k = 2，划分了三组 1 -->  2， 3 -->  4， 5
            // 所以得确保 end 不为空才去找它的 next 指针，否则 null.next 会报错
            for _ in 0..<k {
                // end 不断的向后移动，移动 k 次到达【每一组翻转链表的尾部】
                end = end?.next ;
            }

            // 如果发现 end == nil，说明此时翻转的链表的节点数小于 k ，保存原有顺序就行
            if(end == nil){
                // 直接跳出循环，只执行下面的翻转操作
                break;
            }


            // next 表示【待翻转链表区域】里面的第一个节点
            let next = end?.next

            // 【翻转链表区域】的最尾部节点先断开
            end?.next = nil

            // start 表示【翻转链表区域】里面的第一个节点
            let start: ListNode? = pre?.next



            // 【翻转链表区域】的最头部节点和前面断开
            pre?.next = nil;

            // 这个时候，【翻转链表区域】的头节点是 start，尾节点是 end
            // 开始执行【反转链表】操作
            // 原先是 start --> ...--> end
            // 现在变成了 end --> ...--> start

            // 要翻转的链表的头结点的【上一个节点】的 next 指针指向这次翻转的结果
            pre?.next = reverseNode(start);

            // 接下来的操作是在为【待翻转链表区域】的反转做准备

            // 原先是 start --> ...--> end
            // 现在变成了 end --> ...--> start
            // 【翻转链表区域】里面的尾节点的 next 指针指向【待翻转链表区域】里面的第一个节点
            start?.next = next ;

            // 原先是 start --> ...--> end
            // 现在变成了 end --> ...--> start
            // pre 表示每次要翻转的链表的头结点的【上一个节点】
            pre = start;

            // 将 end 重置为【待翻转链表区域】的头结点的上一个节点。
            end = start;
        }
        return dummy.next
    }
    func reverseNode(_ head: ListNode?) -> ListNode? {
        guard let head = head, let next = head.next else {
            return head
        }
        let current = reverseNode(head.next)
        head.next?.next = head
        head.next = nil
        return current
    }
}
```

