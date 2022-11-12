//
//  字符串 Top10.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2021/10/3.
//  Copyright © 2021 KM. All rights reserved.
//

import Foundation
/*
 * 1) 无重复字符的最长子串
 
 * 2) 有效的括号
 
 * 3) 字符串相加
 
 * 4) 最长回文子串
 
 * 5) 字符串转换整数 (atoi)

 * 6)  翻转字符串里的单词

 * 7)  最小覆盖子串

 * 8) 编辑距离

 * 9) 复原IP地址
 
 * 10) 括号生成

 * 11) 字符串相乘

 * 12) 最长有效括号

 * 13) 比较版本号

 * 14)  验证IP地址
 
 * 15) 最长公共前缀

 * 16) 基本计算器 II

 * 17) 验证回文串
 
 * 18) 反转字符串
 
 * 19)正则表达式匹配
 
 * 20) 有效的括号字符串
 */


// 题解 第1次
// * 1) 无重复字符的最长子串
// 给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。



// * 2) 有效的括号
 
// * 3) 字符串相加
//
// * 4) 最长回文子串
//
// * 5) 字符串转换整数 (atoi)

class Solution {
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
}
