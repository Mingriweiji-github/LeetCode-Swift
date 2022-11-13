

# [297\. 二叉树的序列化与反序列化 \- 力扣（Leetcode）](https://leetcode.cn/problems/serialize-and-deserialize-binary-tree/description/)



序列化是将一个数据结构或者对象转换为连续的比特位的操作，进而可以将转换后的数据存储在一个文件或者内存中，同时也可以通过网络传输到另一个计算机环境，采取相反方式重构得到原数据。

请设计一个算法来实现二叉树的序列化与反序列化。这里不限定你的序列 / 反序列化算法执行逻辑，你只需要保证一个二叉树可以被序列化为一个字符串并且将这个字符串反序列化为原始的树结构。

**提示:** 输入输出格式与 LeetCode 目前使用的方式一致，详情请参阅 [LeetCode 序列化二叉树的格式](https://leetcode.cn/faq/#binary-tree)。你并非必须采取这种方式，你也可以采用其他的方法解决这个问题。

 

**示例 1：**

![img](https://assets.leetcode.com/uploads/2020/09/15/serdeser.jpg)

```
输入：root = [1,2,3,null,null,4,5]
输出：[1,2,3,null,null,4,5]
```

**示例 2：**

```
输入：root = []
输出：[]
```

**示例 3：**

```
输入：root = [1]
输出：[1]
```

**示例 4：**

```
输入：root = [1,2]
输出：[1,2]
```

 

**提示：**

- 树中结点数在范围 `[0, 104]` 内
- `-1000 <= Node.val <= 1000`





#### 结果时间3428 ms 内存15.9 MB

#### 解法

> 通过前序遍历构造二叉树，使用逗号将所有的节点隔开，使用特殊符号#标记所有的空值
>
> 

```swift
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        return preOrder(root)
    }
    // 前序遍历，使用逗号将所有的节点分开，使用#标记空值
    func preOrder(_ root: TreeNode?) -> String {
        var result = ""
        if let root = root {
            result.append(String(root.val) + ",")
            result += preOrder(root.left)
            result += preOrder(root.right)
        } else {
            result.append("#,")
        }
        
        return result
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        // 通过逗号标记找到每一个节点
        var subStrings = data.split(separator: ",")
        return buildBinaryTree(&subStrings)
    }
    // 通过#标记找到空值，对非空的值重建二叉树
    func buildBinaryTree(_ data: inout [Substring]) -> TreeNode? {
        let first = data.first
        if first == "#" {
            data.removeFirst()
            return nil
        }
        let root = TreeNode(Int(first!)!)
        data.removeFirst()
        root.left = buildBinaryTree(&data)
        root.right = buildBinaryTree(&data)
        return root
    }


}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
```



#### 迭代法-结果 180 ms

```swift
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        // 迭代 借助队列
        guard let root = root else {
             return  [nodeToString(root)].joined(separator: "," )
        }
        var queue: [TreeNode] = [root]
        var array: [String] = []
        array.append(nodeToString(root))

        while !queue.isEmpty {
            let node = queue.removeFirst()
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
            array.append(nodeToString(node.left))
            array.append(nodeToString(node.right))
        }
        return array.joined(separator: ",")
    }    
    func deserialize(_ data: String) -> TreeNode? {
        var array = data.components(separatedBy: ",")
        var queue: [TreeNode] = []
        guard array.count > 0, let root = stringToNode(array[0]) else {
            return nil
        }
        queue.append(root)
        var slow = 0
        var fast = 0
        while queue.count > slow {
            let node = queue[slow]
            slow += 1
            node.left = stringToNode(array[fast + 1])
            node.right = stringToNode(array[fast + 2])
            fast += 2
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }

        }
        return root
    }
    // 通过#标记找到空值，对非空的值重建二叉树
    func nodeToString(_ node:TreeNode?) -> String {
        if let node = node {
            return String(node.val)
        } else {
            return "NULL"
        }
    }
    func stringToNode(_ str: String) -> TreeNode? {
        if str != "NULL", let val = Int(str) {
            return TreeNode(val)
        } else {
            return nil
        }
    }


}

// Your Codec object will be instantiated and called as such:
// var ser = Codec()
// var deser = Codec()
// deser.deserialize(ser.serialize(root))
```



