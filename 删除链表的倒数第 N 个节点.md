#### [19. 删除链表的倒数第 N 个结点](https://leetcode.cn/problems/remove-nth-node-from-end-of-list/)

难度中等2051

给你一个链表，删除链表的倒数第 `n` 个结点，并且返回链表的头结点。

 

**示例 1：**

![img](https://assets.leetcode.com/uploads/2020/10/03/remove_ex1.jpg)

```
输入：head = [1,2,3,4,5], n = 2
输出：[1,2,3,5]
```

**示例 2：**

```
输入：head = [1], n = 1
输出：[]
```

**示例 3：**

```
输入：head = [1,2], n = 1
输出：[1]
```

 

**提示：**

- 链表中结点的数目为 `sz`
- `1 <= sz <= 30`
- `0 <= Node.val <= 100`
- `1 <= n <= sz`

 

**进阶：**`你能尝试使用一趟扫描实现吗？`



前言
在对链表进行操作时，一种常用的技巧是添加一个`哑节点（dummy node），它的next 指针指向链表的头节点。这样一来，我们就不需要对头节点进行特殊的判断了。`

例如，在本题中，如果我们要删除节点 yy，我们需要知道节点 yy 的前驱节点 xx，并将 xx 的指针指向 yy 的后继节点。但由于头节点不存在前驱节点，因此我们需要在删除头节点时进行特殊判断。但如果我们添加了哑节点，那么头节点的前驱节点就是哑节点本身，此时我们就只需要考虑通用的情况即可。

![](https://tva1.sinaimg.cn/large/e6c9d24ely1h2kb0kgrzjj217v0u0gpm.jpg)

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
     // 一次遍历
  	 // 随后再从头节点开始对链表进行一次遍历，当遍历到第L−n+1 个节点时，它就是我们需要删除的节点。
  	 func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dump = ListNode(0,head)
        var first = head
        var len = 0
        while first != nil {
            first = first?.next
            len += 1
        }
        var second = dump
        for _ in 1..<(len-n+1) {
            second = second.next!
        }
        second.next = second.next?.next
        return dump.next
    }
    // 直接从头结点到N节点，虚拟链表的哨兵
    // p2记录删除后的链表 p2 = p2.next; p2.next = p2.next.next
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(0, head)
        var p1: ListNode? = head
        var p2: ListNode? = dummy
        var length = 0
        // 通过p1进行遍历；遍历从 1 到 n；
        // p2记录节点 1到 N
        while p1?.next != nil {
            p1 = p1?.next
            length += 1
            guard length >= n else { continue }
            p2 = p2?.next
        }
        p2?.next = p2?.next?.next
        return dummy.next
    }
}
```

#### 思路2:双指针

`由于我们需要找到倒数第n个节点，因此我们可以使用两个指针first 和second同时对链表进行遍历，并且first比second超前n个节点。当first 遍历到链表的末尾时，second 就恰好处于倒数第n 个节点。`

- 具体地，初始时first和second均指向头节点。我们首先使用first对链表进行遍历，遍历的次数为n。
- 此时，first和second之间间隔了n−1个节点，即first 比second 超前了n 个节点。
- 在这之后，我们同时使用first 和second对链表进行遍历。当first遍历到链表的末尾（即first 为空指针）时，second 恰好指向倒数第n 个节点。

根据方法一，如果我们能够得到的是倒数第n 个节点的前驱节点而不是倒数第n 个节点的话，删除操作会更加方便。因此我们可以考虑在初始时将second 指向哑节点，其余的操作步骤不变。

这样一来，当first 遍历到链表的末尾时,second 的下一个节点就是我们需要删除的节点。

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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummy = ListNode(0, head)
        var p1: ListNode? = head
        var p2: ListNode? = dummy
        var length = 0
        // 通过p1进行遍历；遍历从 1 到 n；
        // p2记录节点 1到 N
        while p1?.next != nil {
            p1 = p1?.next
            length += 1
            guard length >= n else { continue }
            p2 = p2?.next
        }
        p2?.next = p2?.next?.next
        return dummy.next
    }
}
```

