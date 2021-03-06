//
//  二叉树BFS.swift
//  Algo-Swift
//
//  Created by longhuadmin on 2020/11/25.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/*
 二叉树：
 必须要定义当前节点的value, 以及可选类型的左子树和右子树
 二叉树实现一个二叉查找树，并且支持插入、删除、查找操作
 实现查找二叉查找树中某个节点的后继、前驱节点
 实现二叉树前、中、后序以及按层遍历
 
 BinaryTree（二叉树）
 01. Same Tree（相同的树）

 02. Symmetric Tree （对称二叉树）

 03. Invert Binary Tree（翻转二叉树）

 04. Maximum Depth of Binary Tree（二叉树的最大深度）

 05. Balanced Binary Tree（判断平衡二叉树）

 06. Validate Binary Search Tree（验证二叉查找树）

 07. Convert Sorted List to Binary Search Tree（有序链表转换二叉查找树）

 08. Flatten Binary Tree to Linked List（二叉树展开为链表）

 09. Binary Tree Zigzag Level Order Traversal（二叉树的锯齿形层次遍历）

 10. Find Largest Value in Each Tree Row（在每个树行中找最大值）

 11. Path Sum（路径总和）

 12. Convert Sorted Array to Binary Search Tree（将有序数组转换为二叉搜索树）
 
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// 实现二叉树前、中、后序
class BinaryTree {
    func preOrderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }
        print(root.val)
        preOrderTraversal(root.left)
        preOrderTraversal(root.right)
    }
    func inOrderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }
        inOrderTraversal(root.left)
        print(root.val)
        inOrderTraversal(root.right)
    }
    func postOrderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }
        postOrderTraversal(root.left)
        postOrderTraversal(root.right)
        print(root.val)
    }
}

// BFS和DFS
// BFS应用层序遍历、最短路径
extension BinaryTree {
    // DFS遍历使用递归
    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }
        dfs(root.left)
        dfs(root.right)
    }
    //BFS遍历使用队列：注意返回结果是一位数组
    func bfs(_ root: TreeNode?) {
        guard let root = root else { return }
        var queue = [TreeNode]()
        queue.append(root)
        
        while !queue.isEmpty {
            let node = queue.removeFirst() // Java 队列移除第一个元素是poll()
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
    }
    // 二叉树的层序遍历
    func bfs2(_ root: TreeNode?) {
        guard let root = root else { return }
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let length = queue.count
            for _ in 0..<length {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            
        }
        
    }
    // BFS 层序遍历
    public func levelOrder(_ root: TreeNode?) -> [[Int]]{
        guard let root = root else { return [[]] }
        var queue = [TreeNode]()
        queue.append(root)
        
        var res = [[Int]]()
        
        while !queue.isEmpty {
            let count = queue.count
            var level = [Int]()
            for _ in 0..<count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(level)
        }
        return res
    }
    
    // BFS 无权最短路径  1162. 地图分析
    
    
}
