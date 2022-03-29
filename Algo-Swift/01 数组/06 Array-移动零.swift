//
//  06 Array-移动零.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2021/9/28.
//  Copyright © 2021 KM. All rights reserved.
//

import Foundation
// 移动数组中的零
// 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
//输入: [0,1,0,3,12]
//输出: [1,3,12,0,0]

//执行用时：
//168 ms
//, 在所有 Swift 提交中击败了
//7.36%
//的用户
//内存消耗：
//14.8 MB
//, 在所有 Swift 提交中击败了
//5.17%
//的用户
//通过测试用例：
//74 / 74

func moveZero(_ nums: inout [Int]) -> [Int] {
    // 解题思路
    // 1. next 记录下一个非零的索引,如果不是 0，next索引后移一位
    // 2. 如果 next 的值小于数组的长度,将nums.count - next 的区间设置为零
    var next = 0
    for value in nums {
        if value != 0 {
            nums[next] = value
            next += 1
        }
    }
    while next < nums.count {
        nums[next] = 0
        next += 1
    }
    return nums
}
