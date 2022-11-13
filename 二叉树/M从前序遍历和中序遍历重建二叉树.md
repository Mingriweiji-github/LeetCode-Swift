[105\. 从前序与中序遍历序列构造二叉树 \- 力扣（Leetcode）](https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solutions/?languageTags=swift)



#### 同题

[剑指 Offer 07. 重建二叉树](https://leetcode-cn.com/problems/zhong-jian-er-cha-shu-lcof/solution/jian-zhi-offer-07-zhong-jian-er-cha-shu-8vx1p/)



#### 相关题

[106. 从中序与后序遍历序列构造二叉树](https://leetcode.cn/problems/construct-binary-tree-from-inorder-and-postorder-traversal/solution/106-cong-zhong-xu-yu-hou-xu-bian-li-xu-l-vr34/)

[889. 根据前序和后序遍历构造二叉树](https://leetcode-cn.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/solution/889-gen-ju-qian-xu-he-hou-xu-bian-li-gou-58ah/)

[449. 序列化和反序列化二叉搜索树](https://leetcode.cn/problems/serialize-and-deserialize-bst/solution/449-xu-lie-hua-he-fan-xu-lie-hua-er-cha-9vh8g/)



#### 解题思路

在前序遍历的结果数组中，第一个元素就是这个树的根节点

而 在中序遍历的结果数组中，根节点左右分别是其子树中的元素。

如果我们 拿到 前序遍历的根节点 root，并在中序遍历中找到这个 root，那么我们可以将 中序遍历的数组分割成两半，这两半就是 root 的左右子树的 中序遍历结果， 此时再回过头来， 我们通过 分割好的子树中序遍历的元素个数，就能在当前 前序遍历数组 进行划分，拿到 root 的左右子树的前序遍历结果

如此这般，我们很容易发现 这里形成了一个递归。



```swift
class Solution {
    // 前序遍历：根左右；中序遍历:左中右
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
       // 边界
        guard preorder.count > 0 else { return nil }
      //前序遍历的首元素是根节点
        let root: TreeNode = TreeNode.init(preorder[0])
      //遍历中序遍历，找到root在 inorder 的索引
        var rootMiddleIndex = 0
        for i in 0..<inorder.count {
            if inorder[i] == preorder[0] { 
                rootMiddleIndex = i
                break
            }
        }
    
      //将中序遍历的数组分割，左右两边分别是 root 的左右子树 A 和 B 的中序遍历数组
      let inorderLeft = Array(inorder[0..<rootMiddleIndex])
      let inorderRight = Array(inorder[rootMiddleIndex+1..<inorder.endIndex])
    
      //! 1. 将前序遍历的数组进行分割，很明显，我们可以通过得到 A 和 B 的数组长度，
      //! 2. 对前序数组进行分割，分别拿到 A B 子树的前序数组
      let preorderLeft = Array(preorder[1..<inorderLeft.count + 1])
      let preorderRight = Array(preorder[inorderLeft.count+1..<preorder.endIndex])
    
      root.left = buildTree(preorderLeft, inorderLeft)
      root.right = buildTree(preorderRight, inorderRight)
      return root

    }
}
```



#### 哈希表：[解法](https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-inorder-traversal/solutions/645826/105-cong-qian-xu-yu-zhong-xu-bian-li-xu-7te45/?languageTags=swift)

![](https://tva1.sinaimg.cn/large/008vxvgGgy1h838gpigczj31dg0aqwfd.jpg)



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
    // 前序遍历：根左右；中序遍历:左中右
    // 哈希映射法
    var hashMap: [Int: Int] = [:]
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
       // 构造哈希映射，帮我们快速定位根节点
       for i in 0..<preorder.count {
           hashMap[inorder[i]] = i
       }
       return subTree(preorder, inorder, 0, preorder.count - 1, 0, inorder.count - 1)
    }
    func subTree(_ preorder: [Int], _ inorder: [Int], _ preorderLeft: Int, _ preorderRight: Int, _ inorderLeft: Int,_ inorderRight: Int) -> TreeNode? {
        if preorderLeft > preorderRight { return nil }
        // 根节点是前序遍历的第一个结点
        let preorderRoot = preorderLeft
        //利用哈希表快速定位中序遍历的根节点
        let inorderRootIndex = hashMap[preorder[preorderRoot]]!
        // 构造根节点root
        let root = TreeNode(preorder[preorderRoot])
        //得到左子树的节点数
        let left_number = inorderRootIndex - inorderLeft 
        // 递归构造左子树并连接到根节点 root 上面
        root.left = subTree(preorder, inorder, preorderLeft + 1, preorderLeft + left_number, inorderLeft, inorderRootIndex - 1)
        // 递归构造右子树并连接到根节点 root 上面
        root.right = subTree(preorder, inorder, preorderLeft + left_number + 1, preorderRight, inorderRootIndex + 1, inorderRight)
        return root
    }
}
```

