//
//  二叉树BFS.swift
//  Algo-Swift
//
//  Created by longhuadmin on 2020/11/25.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/*
 二叉树：必须要定义当前节点的value, 以及可选类型的左子树和右子树
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

class BinaryTree {
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//
//    }
}
