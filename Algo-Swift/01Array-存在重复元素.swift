//
//  01Array.Swift
//  Algo-Swift
//
//  Created by Li on 2021/9/26.
//  Copyright © 2021 KM. All rights reserved.
//

import Foundation
// Swift 数组常见概念
class ArrayBasic {
    func literal() {
        let arr = ["Jack", "Rose", "Lisi"]
        // 仅获取 value
        for people in arr {
            print("people name is\(people)")
        }
        //同时获取 key value
        for (index, name) in arr.enumerated() {
            print("index:\(index), name:\(name)")
        }
        
    }
}

/**
 217. 存在重复元素
 给定一个整数数组，判断是否存在重复元素。
 解题思路: 先排序,然后对比nums[i]和 nums[i + 1]的值是否相等
 */
//func containsDuplicate(_ nums: [Int]) -> Bool {
//    // 1. 数组排序
//    let newNums = nums.sorted()
//    // 2. 对比数组前后的值
//    for (i, _) in newNums.enumerated() {
//        // 这里没有处理边界条件i < count - 1
//        //crash:Fatal error: Index out of range
////        if nums[i] == nums[i + 1] {
////            return true
////        }
//        // 注意处理边界
//        if i < newNums.count - 1, newNums[i] == newNums[i + 1] {
//            return true
//        }
//    }
//    return false
//}

/**
 217. 存在重复元素
 给定一个整数数组，判断是否存在重复元素。
 解题思路: 先排序,然后对比nums[i]和 nums[i + 1]的值是否相等
 */
func containsDuplicate(_ nums: [Int]) -> Bool {
    // 1. 数组排序
    let newNums = nums.sorted()
    // 2. 对比数组前后的值
    for i in 0..<newNums.count - 1 {
        if newNums[i] == newNums[i + 1] {
            return true
        }
    }
    return false
}

