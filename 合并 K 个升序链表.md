#### [23. 合并K个升序链表](https://leetcode.cn/problems/merge-k-sorted-lists/)

给你一个链表数组，每个链表都已经按升序排列。

请你将所有链表合并到一个升序链表中，返回合并后的链表。

 

**示例 1：**

```
输入：lists = [[1,4,5],[1,3,4],[2,6]]
输出：[1,1,2,3,4,4,5,6]
解释：链表数组如下：
[
  1->4->5,
  1->3->4,
  2->6
]
将它们合并到一个有序链表中得到。
1->1->2->3->4->4->5->6
```

**示例 2：**

```
输入：lists = []
输出：[]
```

**示例 3：**

```
输入：lists = [[]]
输出：[]
```

 

**提示：**

- `k == lists.length`
- `0 <= k <= 10^4`
- `0 <= lists[i].length <= 500`
- `-10^4 <= lists[i][j] <= 10^4`
- `lists[i]` 按 **升序** 排列
- `lists[i].length` 的总和不超过 `10^4`

#### 分而治之

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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if(lists.count == 0) {
            return nil
        }
        return divideMerge(lists, 0, lists.count - 1)
    }
    // 分治
    func divideMerge(_ list: [ListNode?], _ left: Int, _ right: Int) -> ListNode? {
        if(left == right) { return list[left] }
        let mid = (left + right) / 2
        let l1 = divideMerge(list, left, mid)
        let l2 = divideMerge(list, mid + 1, right)
        return mergeTwoList(l1, l2)
    }
    // 迭代合并两个有序链表
    func mergeTwoList(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        //设置虚拟链表dummy和指向 dummy 的结点head
        // 遍历l1, l2 的同时 移动head节点：指向l1和l2中 val较小的那个链表
        // 最后其中一个链表为空的话我们 head.next指向另一个指针
        var dummy = ListNode(0)
        var head = dummy
        var l1 = list1, l2 = list2
        while(l1 != nil && l2 != nil) {
            if(l1!.val < l2!.val) {
                head.next = l1
                l1 = l1?.next
            } else {
                head.next = l2
                l2 = l2?.next
            }
            head = head.next!
        }
        head.next = l1 ?? l2
        return dummy.next
    }
}
```



#### 迭代：直接转换为迭代 合并两个有序链表

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
    // 合并 K 个链表的步骤
    // 1.合并两个链表
    // 2.一次合并 0...K个链表即可
    func mergeTwoList(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy = ListNode(-1)
        var node = dummy
        var l1 = l1, l2 = l2
        while(l1 != nil && l2 != nil) {
            if(l1!.val < l2!.val) {
                node.next = l1
                l1 = l1?.next
            } else {
                node.next = l2
                l2 = l2?.next
            }
            node = node.next!
        }
        // 这里注意，while 循环结束代表l1或者l2有一个是遍历结束，需要将node的 next 结点指向另个非空链表
        node.next = l1 ?? l2
        return dummy.next
    }
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if(lists.count == 0) { return nil }
        var ans: ListNode? = nil
        for listNode in lists {
            ans = mergeTwoList(ans, listNode)
        }
        return ans
    }    
}
```

