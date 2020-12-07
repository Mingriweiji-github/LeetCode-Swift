//
//  二叉树BFS.swift
//  Algo-Swift
//
//  Created by longhuadmin on 2020/11/25.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/*
 堆:
 实现一个小顶堆、大顶堆、优先级队列
 实现堆排序
 利用优先级队列合并 K 个有序数组
 求一组动态数据集合的最大 Top K
 
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
