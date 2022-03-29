//
//  08 Array 删除有序数组中的重复项.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2021/9/29.
//  Copyright © 2021 KM. All rights reserved.
//

import Foundation
/*
 给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。

 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

  

 说明:

 为什么返回数值是整数，但输出的答案是数组呢?

 请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


//内存消耗：
//14.2 MB
//, 在所有 Swift 提交中击败了
//90.02%
//的用户
//通过测试用例：
//362 / 362
func removeDuplicates(_ nums: inout [Int]) -> Int {
    // 经典双指针
    // 删除有序数组中重复项
    // 1.指针 p 和 q 分别指向是索引0和1
    // 2.当 nums[p]和 nums[q]相等时,q 指针后移一位,p 指针不变
    // 3.当 nums[p]和 nums[q]不相等,q 的值先赋值给 p + 1 然后 p++, q ++
    // 4.遍历结束时 q等于当前数组的长度, p+1等于新数组的长度
    
    // 临界条件 注意首先排除数组长度为零的情况，否则测试用例报错
    if nums.count == 0 {
        return 0
    }
    var p = 0, q = 1
    for _ in 0..<nums.count - 1 {
        if nums[p] != nums[q] {
            nums[p + 1] = nums[q]
            p += 1
        }
        q += 1
    }
    return p + 1
}
