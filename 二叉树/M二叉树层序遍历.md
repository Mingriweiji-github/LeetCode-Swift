

# [102\. 二叉树的层序遍历 \- 力扣（Leetcode）](https://leetcode.cn/problems/binary-tree-level-order-traversal/description/)



给你二叉树的根节点 `root` ，返回其节点值的 **层序遍历** 。 （即逐层地，从左到右访问所有节点）。

 

**示例 1：**

![img](https://assets.leetcode.com/uploads/2021/02/19/tree1.jpg)

```
输入：root = [3,9,20,null,null,15,7]
输出：[[3],[9,20],[15,7]]
```

**示例 2：**

```
输入：root = [1]
输出：[[1]]
```

**示例 3：**

```
输入：root = []
输出：[]
```

 

**提示：**

- 树中节点数目在范围 `[0, 2000]` 内
- `-1000 <= Node.val <= 1000`



#### 借助队列来存放每一层的结果level

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
    //借助队列特性和一位数组level来存储每一层的节点
    // 二维数组存放每一层的结果
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        // 辅助队列，根节点直接入队列
        var queue: [TreeNode] = [root]
        var result: [[Int]] = []
        // 队列循环queue 不为空
        while !queue.isEmpty {
            // 1.获取到当前结点 node,node 的值放入结果集合res中
            // 2.左子树不为空入队列
            // 3.右子树不为空入队列
            // 借助 level数组存放每一层的值
            var level: [Int] = []
            for _ in 0..<queue.count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            // 一层遍历结束，将每一层的结果 level 放入到二维数组res中
            result.append(level)
        }
        // 得到结果是二维数组
        return result 
    }
}
```





![](https://tva1.sinaimg.cn/large/008vxvgGgy1h839t8npnvj31eo0de75f.jpg)