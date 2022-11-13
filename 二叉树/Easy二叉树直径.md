[543\. 二叉树的直径 \- 力扣（Leetcode）](https://leetcode.cn/problems/diameter-of-binary-tree/description/)



给定一棵二叉树，你需要计算它的直径长度。一棵二叉树的直径长度是任意两个结点路径长度中的最大值。这条路径可能穿过也可能不穿过根结点。

 

**示例 :**
给定二叉树

```
          1
         / \
        2   3
       / \     
      4   5    
```

返回 **3**, 它的长度是路径 [4,2,1,3] 或者 [5,2,1,3]。

 

**注意：**两结点之间的路径长度是以它们之间边的数目表示。



### 解题思路

> ​        // 递归如果是空节点返回 0
>
> ​        //左子树深度
>
> ​        //右子树深度
>
> ​        // 当前深度l + r + 1
>
> ​        // 返回该节点为根节点的子树的深度 max(ans, L + R + 1)



```swift
		var ans:Int = 0
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        depth(root)
        return ans - 1
    }
    func depth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let l = depth(root.left)
        let r = depth(root.right)
        ans = max(l + r + 1, ans)
        return max(l, r) + 1
    }
```

