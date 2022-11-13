[114\. 二叉树展开为链表 \- 力扣（Leetcode）](https://leetcode.cn/problems/flatten-binary-tree-to-linked-list/description/)



给你二叉树的根结点 `root` ，请你将它展开为一个单链表：

- 展开后的单链表应该同样使用 `TreeNode` ，其中 `right` 子指针指向链表中下一个结点，而左子指针始终为 `null` 。
- 展开后的单链表应该与二叉树 [**先序遍历**](https://baike.baidu.com/item/先序遍历/6442839?fr=aladdin) 顺序相同。

 

**示例 1：**

![img](https://assets.leetcode.com/uploads/2021/01/14/flaten.jpg)

```
输入：root = [1,2,5,3,4,null,6]
输出：[1,null,2,null,3,null,4,null,5,null,6]
```

**示例 2：**

```
输入：root = []
输出：[]
```

**示例 3：**

```
输入：root = [0]
输出：[0]
```

 

**提示：**

- 树中结点数在范围 `[0, 2000]` 内
- `-100 <= Node.val <= 100`

 



#### 递归

所谓展开二叉树为链表，就是将根节点的所有左节点置为空，然后将原来的左节点放到右结点前面，形成链表

- 1.利用一个全局变量 pre，更新当前根节点root的右指针为 pre，左指针为 null。
- 2.pre继承 root

```swift
class Solution {
    // 解法一递归根节点：
    // 利用一个全局变量 pre，更新当前根节点root的右指针为 pre，左指针为 null。
    // 最后将root赋值给 pre
    var pre: TreeNode? = nil
    func flatten(_ root: TreeNode?) {
        guard let root = root else { return }
        flatten(root.right)
        flatten(root.left)
        root.right = pre
        root.left = nil
        pre = root
    }
}
```



**进阶：**你可以使用原地算法（`O(1)` 额外空间）展开这棵树吗？

根据我们的观察，本题应该是使用深度优先搜索的方式来解决，我们看看是怎样变成一个列表的。如图所示：

### 解法二

> 将节点的左子树变成链表，将根节点的右子树变成链表，将树的右边变成左边的链表同时将左边的子树清空
>
> 找到树的最右边结点同时将右边的链表接到刚才树的最右边的节点上

#### Swift版本

```swift
class Solution {
    
    func flatten(_ root: TreeNode?) {
        guard var root = root else { return }
        flatten(root.left)
        flatten(root.right)
        // 找到右边的节点，将右边的变成左边的，左边的变成空
        let temp = root.right
        root.right = root.left
        root.left = nil
        // 找到最右边的节点
        while let right = root.right { root = right }
        // 将右边链表接到最右边的节点上
        root.right = temp
    }
}
```



#### Java 版本

[114\. 二叉树展开为链表 \- 力扣（Leetcode）](https://leetcode.cn/problems/flatten-binary-tree-to-linked-list/solutions/218689/114-er-cha-shu-zhan-kai-wei-lian-biao-by-ming-zhi-/)

```swift
class Solution {
    public void flatten(TreeNode root) {
        if(root == null){
            return ;
        }
        //将根节点的左子树变成链表
        flatten(root.left);
        //将根节点的右子树变成链表
        flatten(root.right);
        TreeNode temp = root.right;
        //把树的右边换成左边的链表
        root.right = root.left;
        //记得要将左边置空
        root.left = null;
        //找到树的最右边的节点
        while(root.right != null) root = root.right;
        //把右边的链表接到刚才树的最右边的节点
        root.right = temp;
    }
}

```

