//
//  10 Array 在排序树组中查找数字.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2021/10/2.
//  Copyright © 2021 KM. All rights reserved.
//

import Foundation
// TODO
// 查找算法-经典二分法
// 利用二分法分别确定 target 的左右边界,结果是 right-left-1
func search(_ nums: [Int], _ target: Int) -> Int {
    if nums.count == 0 {
        return 0
    }
    // 初始化左右指针
    var i = 0, j = nums.count - 1
    //第一次二分法:找到 right 边界
    //这边是“小于等于”，因此当循环结束后，ij不重合，且如果存在target值的话，i的位置就是右边界（target值序列右边第一个大于target值的位置），因为最后一次循环一定是i=mid+1；且此时j指向target
    while (i <= j) {
        let mid = (i + j) >> 1
        // 这里是小于等于,目的是为了确定右边界,当 mid==target 时,因为不确定后面是否还有 target,所以需要左边界收缩
        if nums[mid] <= target {
            i = mid + 1
        } else {
            j = mid - 1
        }
    }
    // 更新右边界 right = i
    let right = i
    if j >= 0 && nums[j] != target {
        return 0
    }
    
    i = 0
    //第二次二分查找 left 边界
    while (i <= j) {
        let mid = (i + j) >> 1
        if nums[mid] >= target {
            j = mid - 1
        } else {
            i = mid + 1
        }
    }
    let left = j
    return right - left - 1
}
