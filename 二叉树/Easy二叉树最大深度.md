[104\. 二叉树的最大深度 \- 力扣（Leetcode）](https://leetcode.cn/problems/maximum-depth-of-binary-tree/description/)



给定一个二叉树，找出其最大深度。

二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

**说明:** 叶子节点是指没有子节点的节点。

**示例：**
给定二叉树 `[3,9,20,null,null,15,7]`，

```
    3
   / \
  9  20
    /  \
   15   7
```

返回它的最大深度 3 。

#### BFS思路

```swift
	// 递归法分别求左右子树的高度
  // 二叉树最大深度=root左右子树最大深度+1
  func maxDepth(_ root: TreeNode?) -> Int {
      guard let root = root else { return 0 }
      let leftDepth = maxDepth(root.left)
      let rightDepth = maxDepth(root.right)
      return max(leftDepth, rightDepth) + 1
  }
```



#### DFS思路

> 我们也可以用「广度优先搜索」的方法来解决这道题目，但我们需要对其进行一些修改，此时我们广度优先搜索的队列里存放的是「当前层的所有节点」。
>
> 每次拓展下一层的时候，不同于广度优先搜索的每次只从队列里拿出一个节点，我们需要将队列里的所有节点都拿出来进行拓展，这样能保证每次拓展完的时候队列里存放的是当前层的所有节点，即我们是一层一层地进行拓展
>
> 最后我们用一个变量 ans\textit{ans}ans 来维护拓展的次数，该二叉树的最大深度即为 ans\textit{ans}ans。


![](https://tva1.sinaimg.cn/large/008vxvgGgy1h82a905w11j317i0de75a.jpg)

```swift
class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue: [TreeNode] = []
        queue.append(root)
        var depth = 0
        while queue.count > 0 {
            var size = queue.count 
            while size > 0 {
                let node = queue.removeFirst() // 队列先进先出
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
                size -= 1
            }
            depth += 1
        }
        return depth
    }
}
```



#### DFS

![](https://tva1.sinaimg.cn/large/008vxvgGgy1h82a7vhe8xj318u0f6wfj.jpg)

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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }        
        var depth = 0
        var queue: [TreeNode] = [root]
        while queue.count > 0 {
            for i in 0..<queue.count {
                let node = queue.removeFirst()
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            depth += 1
        }
        return depth
    }
}
```





