#### [142. 环形链表 II](https://leetcode.cn/problems/linked-list-cycle-ii/)

难度中等1589

给定一个链表的头节点  `head` ，返回链表开始入环的第一个节点。 *如果链表无环，则返回 `null`。*

如果链表中有某个节点，可以通过连续跟踪 `next` 指针再次到达，则链表中存在环。 为了表示给定链表中的环，评测系统内部使用整数 `pos` 来表示链表尾连接到链表中的位置（**索引从 0 开始**）。如果 `pos` 是 `-1`，则在该链表中没有环。**注意：`pos` 不作为参数进行传递**，仅仅是为了标识链表的实际情况。

**不允许修改** 链表。



 

**示例 1：**

![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)

```
输入：head = [3,2,0,-4], pos = 1
输出：返回索引为 1 的链表节点
解释：链表中有一个环，其尾部连接到第二个节点。
```

**示例 2：**

![img](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/12/07/circularlinkedlist_test2.png)

```
输入：head = [1,2], pos = 0
输出：返回索引为 0 的链表节点
解释：链表中有一个环，其尾部连接到第一个节点。
```

**示例 3：**

![img](https://assets.leetcode-cn.com/aliyun-lc-upload/uploads/2018/12/07/circularlinkedlist_test3.png)

```
输入：head = [1], pos = -1
输出：返回 null
解释：链表中没有环。
```

 

**提示：**

- 链表中节点的数目范围在范围 `[0, 104]` 内
- `-105 <= Node.val <= 105`
- `pos` 的值为 `-1` 或者链表中的一个有效索引

 

**进阶：**你是否可以使用 `O(1)` 空间解决此题？



#### Java版本

```java
/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
    public ListNode detectCycle(ListNode head) {
        // 1.快慢指针找到相遇的结点
        // 2.两个指针分别从头结点和相遇结点开始，每次各自走一步，它们相遇的结点就是链表入环的结点
        ListNode fast = head;
        ListNode slow = head;
        // 链表有环-fast 指针不为空，fast的 next 指针也不为空
        while(fast != null && fast.next != null) {
            // fast 指针每次走两步，slow 指针每次走一步
            fast = fast.next.next;
            slow = slow.next;
            // 有环的判断条件是: fast==slow,然后开始找第一个入环的节点
            if (fast == slow) {
                //入环节点寻找的逻辑是：从相遇的结点 fast/slow 和从头结点 head 开始的两个新的指针，他们相遇的节点就是我们环形链表的入环节点
                ListNode a = slow;
                ListNode b = head;
                while(a != b) {
                    a = a.next;
                    b = b.next;
                }
                //如果跳出循环说明：a == b，返回节点 a或者 b 即可
                return b;
            }
        }
        return null;
    }
}
```



#### Swift版本

1.快慢指针分别指向head

2.从头结点开始，快指针每次走两步 慢指针每次走一步，如果它们相遇就是环形链表的入口

3.寻找环形链表入环的节点：当 fast 和 slow 相遇，从它们相遇的节点和头结点 head分别开始两个新指针a b

4.当 a 和b 相等时，就是我们要找的入口节点；否则 a和 b 指针分别向前移动直到它们相遇

```swift
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        //1.快慢指针分别指向head
        //2.从头结点开始，快指针每次走两步 慢指针每次走一步，如果它们相遇就是环形链表的入口
        //3.寻找环形链表入环的节点：当 fast 和 slow 相遇，从它们相遇的节点和头结点 head分别开始两个新指针a b
        //4.当 a 和b 相等时，就是我们要找的入口节点；否则 a和 b 指针分别向前移动直到它们相遇
        var fast: ListNode? = head
        var slow: ListNode? = head
        while(fast != nil && fast?.next != nil){
            fast = fast?.next?.next
            slow = slow?.next
            if(fast === slow) {
                var a: ListNode? = head
                var b: ListNode? = fast
                while( a !== b) {
                    a = a?.next
                    b = b?.next
                }
                return b
            }
        }
        return nil
    }
}
```

