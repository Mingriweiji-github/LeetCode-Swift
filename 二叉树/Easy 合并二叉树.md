

[617\. 合并二叉树 \- 力扣（Leetcode）](https://leetcode.cn/problems/merge-two-binary-trees/description/)



给你两棵二叉树： `root1` 和 `root2` 。

想象一下，当你将其中一棵覆盖到另一棵之上时，两棵树上的一些节点将会重叠（而另一些不会）。你需要将这两棵树合并成一棵新二叉树。合并的规则是：如果两个节点重叠，那么将这两个节点的值相加作为合并后节点的新值；否则，**不为** null 的节点将直接作为新二叉树的节点。

返回合并后的二叉树。

**注意:** 合并过程必须从两个树的根节点开始。

 

**示例 1：**

![img](https://assets.leetcode.com/uploads/2021/02/05/merge.jpg)

```
输入：root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
输出：[3,4,5,5,4,null,7]
```

**示例 2：**

```
输入：root1 = [1], root2 = [1,2]
输出：[2,2]
```

 

**提示：**

- 两棵树中的节点数目在范围 `[0, 2000]` 内
- `-104 <= Node.val <= 104`



#### 解题思路

合并两个二叉树：

如果其中一个二叉树为空，直接返回另一个二叉树

如果两个二叉树都不是空，使用两个二叉树的值来初始化二叉树 merged

递归左子树，递归右子树，返回结果merged



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
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        // 如果其中一颗为空，则直接赋值给另一个
        // 如果两课叶子结点都不为空，将它们的值相加
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        let merged = TreeNode(root1.val + root2.val)
        merged.left = mergeTrees(root1.left, root2.left)
        merged.right = mergeTrees(root1.right, root2.right)
        return merged
    }
}
```

