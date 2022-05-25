

#### [82. 删除排序链表中的重复元素 II](https://leetcode.cn/problems/remove-duplicates-from-sorted-list-ii/)

给定一个已排序的链表的头 `head` ， *删除原始链表中所有重复数字的节点，只留下不同的数字* 。返回 *已排序的链表* 。

 

**示例 1：**

![img](https://assets.leetcode.com/uploads/2021/01/04/linkedlist1.jpg)

```
输入：head = [1,2,3,3,4,4,5]
输出：[1,2,5]
```

**示例 2：**

![img](https://assets.leetcode.com/uploads/2021/01/04/linkedlist2.jpg)

```
输入：head = [1,1,1,2,3]
输出：[2,3]
```

 

**提示：**

- 链表中节点数目在范围 `[0, 300]` 内
- `-100 <= Node.val <= 100`
- 题目数据保证链表已经按升序 **排列**





#### 方法一：一次遍历

##### 思路与算法

![](https://tva1.sinaimg.cn/large/e6c9d24ely1h2k9tcqpidj21g80ryah4.jpg)

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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        // 虚拟节点 dummy, dummy.next指向 head 链表
        var dummyHead = ListNode(-1)
        dummyHead.next = head

        var cur = dummyHead
        while(cur.next != nil && cur.next?.next != nil) {
            if (cur.next?.val == cur.next?.next?.val) {
                let val = cur.next?.val
                // cur的 next 结点的值如果存在相同的情况，我们就删除
                // 删除的方式通过cur.next = cur.next?.next的方式
                while(cur.next != nil && cur.next?.val == val) {
                    cur.next = cur.next?.next
                }
            } else {
                cur = cur.next!
            }
        }
        
        return dummyHead.next
    }
}
```

> 执行用时：16 ms, 在所有 Swift 提交中击败了97.28%的用户
>
> 内存消耗：14.1 MB, 在所有 Swift 提交中击败了8.16%的用户
>
> 通过测试用例：166 / 166