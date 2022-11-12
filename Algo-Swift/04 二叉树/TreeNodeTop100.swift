//
//  TreeNode100.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2022/8/25.
//  Copyright © 2022 KM. All rights reserved.
//

import Foundation

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    // 栈 先进后出
    // 中序遍历，左根右；入栈顺序右根左
    var ans: [Int] = []
    var stack: [TreeNode] = []
    var cur: TreeNode? = root
    // root为空且 stack 为空，遍历结束
    while(cur != nil || !stack.isEmpty) {
        // 首先 root 不为空，遍历左节点
        while(cur != nil) {
            //先根后左入栈
            guard let real = cur else { break }
            stack.append(real)
            cur = real.left
        }
        // 此时root==null，说明上一步的root没有左子树
        // 1. 执行左出栈。因为此时root==null，导致root.right一定为null
        // 2. 执行下一次外层while代码块，根出栈。此时root.right可能存在
        // 3a. 若root.right存在，右入栈，再出栈
        // 3b. 若root.right不存在，重复步骤2
        cur = stack.popLast()
        if let real = cur {
            ans.append(real.val)
            cur = real.right
        }
    }
    return ans
}
