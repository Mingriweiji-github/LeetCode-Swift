//
//  LeecodeTop100.swift
//  Algo-Swift
//
//  Created by longhuadmin on 2020/11/25.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation

// 栈 + 8 | Hot100: https://leetcode-cn.com/problemset/leetcode-hot-100/?topicSlugs=stack

class StackSolution {
    
    /**
    20. 有效括号:https://leetcode-cn.com/problems/valid-parentheses/
     数据结构：使用栈，后进先出
    ------------------------------------
     给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
     有效字符串需满足：1、左括号必须用相同类型的右括号闭合2、左括号必须以正确的顺序闭合。
     ------------------------------------
     思路：https://leetcode-cn.com/problems/valid-parentheses/solution/zhu-bu-fen-xi-tu-jie-zhan-zhan-shi-zui-biao-zhun-d/
     
     * 解题思路：Swfit 中我们使用数组来模拟栈,使用字典模拟哈希表存放键值对[右括号: 左括号]
     *a.如果字符c是左括号，放入栈中stack.push。
     *b、如果字符c是右括号，判断stack.pop() == dic[c]，不对应提前返回false
     *c、判断栈是否为空，不为空说明栈中存在不匹配的
     **/
    func isValid(_ s: String) -> Bool {
        
        var stack = [String]() // 模拟栈存放左括号
        let dict = [")": "(", "]": "[", "}" : "{"]; // 哈希键值对存放 右括号: 左括号
        
        for c in s {
            // 如果是左括号-入栈 stack 中都是左括号
            if dict.values.contains(String(c)) {
                stack.append(String(c))
            } else if  stack.last ==  dict[String(c)] {
                // 若果栈最后一个左括号==哈希表中对应的右括号,匹配成功
                stack.removeLast()
            } else {
                // 只要一个右括号没有匹配成功,那就结束循环返回 false
                return false
            }
        }
        // 最后如果左括号容器-stack 清空代表全部匹配到右括号,符合要求是有效括号
        // 否则是无效的括号
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
    
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [Int]()
        var result: [Int] = Array(repeating: 0, count: temperatures.count)
        
        for current in 0..<temperatures.count {
            while let last = stack.last, temperatures[current] > temperatures[last] {
                stack.removeLast()
                result[last] = current - last
            }
            stack.append(current)
        }
        return result
    }
    
}
