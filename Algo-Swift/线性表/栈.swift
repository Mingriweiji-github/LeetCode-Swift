//
//  LeecodeTop100.swift
//  Algo-Swift
//
//  Created by longhuadmin on 2020/11/25.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation

// 栈 + 8 | Hot100: https://leetcode-cn.com/problemset/leetcode-hot-100/?topicSlugs=stack

class StringSolution {
    
    /**
    20. 有效括号:https://leetcode-cn.com/problems/valid-parentheses/
     数据结构：使用栈，后进先出
    ------------------------------------
     给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
     有效字符串需满足：1、左括号必须用相同类型的右括号闭合2、左括号必须以正确的顺序闭合。
     ------------------------------------
     思路：https://leetcode-cn.com/problems/valid-parentheses/solution/zhu-bu-fen-xi-tu-jie-zhan-zhan-shi-zui-biao-zhun-d/
     
     * 解题思路：
     *a.如果字符c是左括号，放入栈中stack.push。
     *b、如果字符c是右括号，判断stack.pop() == dic[c]，不对应提前返回false
     *c、判断栈是否为空，不为空说明栈中存在不匹配的
     **/
    func isValid(_ s: String) -> Bool {
        
        var stack = [String]()
        
        for char in s {
            let str = String(char)
            if let l = stack.last, l == "(" {
                if str == ")" {
                    stack.removeLast()
                } else {
                    stack.append(str)
                }
            }
            else if let l = stack.last, l == "[" {
                if str == "]" {
                    stack.removeLast()
                } else {
                    stack.append(str)
                }
            }
            else if let l = stack.last, l == "{" {
                if str == "}" {
                    stack.removeLast()
                } else {
                    stack.append(str)
                }
            }
            else {
                stack.append(str)
            }
        }
        
        return stack.isEmpty
    }
    // Swift解题: https://leetcode-cn.com/problems/valid-parentheses/solution/swift-jin-liang-jian-ji-de-mo-ni-zhan-4ms-by-tqmax/
    func isCharacterValid(_ s: String) -> Bool {
        let map = [")": "(", "]": "[", "}": "{"] // 哈希索引
        var stack = [String]() // 模拟栈
        for c in s {
            let str = String(c)
            if map.values.contains(str) { // 左括号入栈
                stack.append(str)
            } else if stack.count > 0, String(stack.last!) == map[str] { // 右括号出栈
                stack.removeLast()
            } else {
                return false
            }
        }
        return stack.isEmpty // 栈空才是真爱
    }
 
    
}
