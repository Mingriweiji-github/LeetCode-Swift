//
//  BinarySearch.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/26.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/*
 二分查找42亿个数据最多仅仅需要32次查找
 二分查找条件：有序的数组，数据量不能太大，因为要求是顺序表结构，连续内存不能太大
 要求: 查找数组中是否存在target,存在返回target所在下标，否则返回-1
 */

//二分查找递归: 有序数组+数据量不能太大（要求有序数组需要连续的内存空间）
//bsearch(a,low,high) = bsearch(a,low, mid - 1) + bsearch(a, mid + 1, high)
func bSearch(_ a: [Int], low: Int, high: Int, target: Int) -> Int {
    if low > high {
        return -1
    }
    let mid = low + (high - low) / 2
    if target < a[mid] {
        return bSearch(a, low: low, high: mid - 1, target: target)
    } else if target > a[mid] {
        return bSearch(a, low: mid + 1 , high: high, target: target)
    } else {
        return mid
    }
    return -1
}

/*
 注意：1 退出条件是low <= high
      2、mid=(low+high)/2 这种写法是有问题的。因为如果 low 和 high 比较大的话，两者之和就有可能会溢出。改进的方法是将 mid 的计算方式写成 low+(high-low)/2。更进一步，如果要将性能优化到极致的话，我们可以将这里的除以 2 操作转化成位运算 low+((high-low)>>1)。因为相比除法运算来说，计算机处理位运算要快得多。
      3、low = mid + 1, high = mid - 1,如果low = mid,high = mid,此时a[mid] != target的话造成死循环。
 */
func binarySearch(_ target: Int, _ array: [Int]) -> Int {
    var low = 0, high = array.count - 1
    let mid = low + (high - low) / 2
    while low <= high {
        if array[mid] < target {
            low = mid + 1
        } else if array[mid] == target {
            return mid
        } else {
            high = mid - 1
        }
    }
    return -1
}

// 变形一：查找存在多个重复元素的数组中第一个等于target的元素
func bSearchFirt(_ a: [Int], target: Int) -> Int {
    var low = 0, high = a.count - 1
    let mid = low + (high - low) / 2

    while low <= high {
        if target > a[mid] {
            low = mid + 1
        } else if target < a[mid] {
            high = mid - 1
        } else {
            if mid == 0 || a[mid - 1] != target {
                return mid
            } else {
                high = mid - 1
            }
        }
    }
    return -1
}

// 变形二：查找存在多个重复元素的数组中最后一个等于target的元素
func bSearchLast(_ a: [Int], target: Int) -> Int {
    var low = 0, high = a.count - 1
    let mid = low + (high - low) / 2
    while low <= high {
        if target > a[mid] {
            low = mid + 1
        } else if target < a[mid] {
            high = mid - 1
        } else {
            if mid == a.count - 1 || a[mid + 1] != target {
                return mid
            } else {
                low = mid + 1
            }
        }
    }

    return -1
}
/// 变形三：查找第一大于等于给定target的元素
func bSearchGreatOrEqual(_ a: [Int], target: Int) -> Int {
    var low = 0, high = a.count - 1
    let mid = low + (high - low) / 2
    while low <= high {
        if target <= a[mid] {
            if a[mid - 1] > target {
                high = mid - 1
            } else {
                return mid
            }
        } else {

        }
    }
    return -1
}
