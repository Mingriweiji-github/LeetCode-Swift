//
//  03Array-两数之和.swift
//  Algo-Swift
//
//  Created by Li on 2021/9/27.
//  Copyright © 2021 KM. All rights reserved.
//
/*
 1. 两数之和
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。

 你可以按任意顺序返回答案。
 
 提示：

 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 只会存在一个有效答案

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 
 */
func twoSumSolution(_ nums: [Int], _ target: Int) -> [Int] {
    //使用字典保存,key 是我们期待的值,value 是数组的索引
    //当数组中存在我们期待值 expect 对应的索引时,返回对应索引所在的位置fromIndex
    // 返回数组[fromIndex,index]
    var dic: [Int: Int] = [:]
    for (index, num) in nums.enumerated() {
        //先通过遍历找我们的期望值
        let expect = target - num
        // 如果数组中存在字典value 对应的索引
        if let fromIndex = dic[expect], fromIndex != index {
            return [fromIndex, index]
        }
        //使用字典保存索引
        dic[num] = index
    }
    return []
}
