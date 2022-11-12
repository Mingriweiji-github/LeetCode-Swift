#### [101. 对称二叉树](https://leetcode.cn/problems/symmetric-tree/)

难度简单1933

给你一个二叉树的根节点 `root` ， 检查它是否轴对称。

 

**示例 1：**

![img](https://assets.leetcode.com/uploads/2021/02/19/symtree1.jpg)

```
输入：root = [1,2,2,3,4,4,3]
输出：true
```

**示例 2：**

![img](https://assets.leetcode.com/uploads/2021/02/19/symtree2.jpg)

```
输入：root = [1,2,2,null,3,null,3]
输出：false
```

 

**提示：**

- 树中节点数目在范围 `[1, 1000]` 内
- `-100 <= Node.val <= 100`

 

**进阶：**你可以运用递归和迭代两种方法解决这个问题吗？









#### 递归解法

> 执行用时：8 ms, 在所有 Swift 提交中击败了96.76%的用户
>
> 内存消耗：13.7 MB, 在所有 Swift 提交中击败了84.14%的用户
>
> 通过测试用例：198 / 198

```swift
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        // 镜像对称root.left和 root.right
        return isMirror(root.left, root.right)
    }
    func isMirror(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if let p = p,let q = q, p.val == q.val {
            return isMirror(p.left, q.right) && isMirror(p.right, q.left)
        }
        return false
    }
}
```



```swift
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        return isMirro(root.left, root.right)
    }
    func isMirro(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        // 递归遍历到最后，左右子树同时为空
        if(p == nil && q == nil) { return true }
        if let p = p, let q = q, p.val == q.val {
            // p和 q 同时不为空且值相等
            // 分别判断p.left和 q.right, p.right和 q.left是否相同
            return isMirro(p.left, q.right) && isMirro(p.right, q.left)
        }
        return false
    }   
}
```

