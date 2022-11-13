[226\. 翻转二叉树 \- 力扣（Leetcode）](https://leetcode.cn/problems/invert-binary-tree/description/)



给你一棵二叉树的根节点 `root` ，翻转这棵二叉树，并返回其根节点。

**示例 1：**

![img](https://assets.leetcode.com/uploads/2021/03/14/invert1-tree.jpg)

```
输入：root = [4,2,7,1,3,6,9]
输出：[4,7,2,9,6,3,1]
```

**示例 2：**

![img](https://assets.leetcode.com/uploads/2021/03/14/invert2-tree.jpg)

```
输入：root = [2,1,3]
输出：[2,3,1]
```

**示例 3：**

```
输入：root = []
输出：[]
```

 

**提示：**

- 树中节点数目范围在 `[0, 100]` 内
- `-100 <= Node.val <= 100`



## 解题思路

#### 迭代法翻转二叉树  2022.11.12 13:53

- 交换每一个结点的左右子树，我们用队列储存没有交换过的左右子树的结点
- 先通过队列拿到当前的 node结点后，使用临时变量和当前的 node交换左右结点
- 然后再将该节点的左右结点加入到队列中。直到队列为空截止。

![](https://tva1.sinaimg.cn/large/008vxvgGgy1h82av9b7k8j31ag0cwt9l.jpg)



```swift
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var queue: [TreeNode] = [root]
        while queue.count > 0 {
            let node = queue.removeFirst()
            // 先翻转当前节点 node 的左右叶子结点
            let temp = node.left
            node.left = node.right
            node.right = temp
            // 然后将尚未翻转的叶子结点加入到当前队列queue中直到 queue 为空
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
        return root
    }
}
```

