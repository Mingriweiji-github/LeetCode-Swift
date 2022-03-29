//
//  Stack.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/24.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/**
* Swift 栈基础操作
*/
protocol Stack {
    ///持有的数据
    associatedtype Element
    ///是否为空
    var isEmpty: Bool { get }
    ///空间大小
    var size: Int { get }
    ///入栈操作
    mutating func push(_ ele: Element) -> Bool
    ///出栈操作
    mutating func pop() -> Element?
}

/**
 ** 11、有效的括号
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 有效字符串需满足：1、左括号必须用相同类型的右括号闭合2、左括号必须以正确的顺序闭合。
------------------------------------
 * 解题思路：
 *a.如果字符c是左括号，放入栈中stack.push。
 *b、如果字符c是右括号，判断stack.pop() == dic[c]，不对应提前返回false
 *c、判断栈是否为空，不为空说明栈中存在不匹配的
 **/

func isValid(_ s: String) -> Bool {
    var stack: [String] = []
    let dic: [String: String] = [")":"(","]":"[","}":"{"]
    for c in s {
        let c = String(c)
        if !dic.keys.contains(c) {
            stack.append(c)
        } else if stack.popLast() != dic[c] {
            return false
        }
    }
    return stack.count == 0
}
