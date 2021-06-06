//
//  Array.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/18.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/**
* 1) 合并两个有序数组
* 2) 颜色分类
* 3) 部分排序
* 4) 有序数组的平方
 
* 5) 最大间距
* 7) 多数元素 easy
* 6) 求三数之和 medium
* 8) 缺失的第一个正数 hard
 
*/

// 1）合并两个有序数组
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
     var p1 = m - 1, p2 = n - 1
     var cur = m + n - 1
     while (p2 >= 0) {
         if (p1 >= 0 && nums1[p1] >= nums2[p2]) {
             nums1[cur] = nums1[p1]
             cur -= 1; p1 -= 1
         } else {
             nums1[cur] = nums2[p2]
             cur -= 1; p2 -= 2
         }
     }
 }
/*
 2. 颜色分类
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。

 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。

 注意:
 不能使用代码库中的排序函数来解决这道题。
 */
func setColors(_ nums: inout [Int]) {
    //1、遇到0 和 left交换，left++ cur++
    //2、遇到1 cur++
    //3、遇到2 和 right交换，right-- cur++  :更正交换后right--但是cur不能++，因为right的位置需要重新判断
    //循环条件cur<=right
    var cur = 0, left = 0, right = nums.count - 1
    while cur <= right {
        let curNum = nums[cur]
        if curNum == 0 {
            swapNum(&nums, cur, left)
            cur += 1
            left += 1
        } else if curNum == 1 {
            cur += 1
        } else {
            swapNum(&nums, cur, right)
            //注意：遇到2和right交换值以后，right--需要重新判断cur的值，所以cur不能++
            //cur += 1
            right -= 1
        }
    }

}
func swapNum(_ nums: inout [Int], _ i: Int, _ j: Int) {
    let temp = nums[i]
    nums[i] = nums[j]
    nums[j] = temp
}

//3. 部分排序
func subSort(_ array: [Int]) -> [Int] {
    //1 从左往右扫描，应该越来越大，出现比max小的，记录下来
    //2 从右往左扫描，应该越来越小，出现比min小的，记录下来
    if array.count < 2 {
        return [-1, -1]
    }
    var max = array[0], R = -1
    for i in 0..<array.count {
        let v = array[i]
        if v >= max {
            max = v
        } else {
            R = i
        }
    }
    var min = array[array.count - 1], L = -1
    for i in (0...(array.count - 2)).reversed() {
        let v = array[i]
        if v <= min {
            min = v
        } else {
            L = i
        }
    }
    return [L, R]
}
// 4、有序数组的平方
func sortedSquares(_ A: [Int]) -> [Int] {
    let sortedA = A.map { $0 * $0 }
    return sortedA.sorted()
}

