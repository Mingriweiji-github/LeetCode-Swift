//
//  Sort01.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/24.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/// 冒泡排序
func bubbleSort<T>(_ array: [T]) -> [T] where T: Comparable{
    var array = array
    guard array.count > 1 else {
        return array
    }
    for i in 0..<array.count {
        //提前退出标志
        var flag: Bool = false
        for j in 0..<array.count - i - 1 {
            if array[j] > array[j + 1] {
                array.swapAt(j + 1, j)
                //有数据交换
                flag = true
            }
        }
        //没有数据交换-提前退出
        if flag == false {
            break
        }
    }
    return array
}

///插入排序
func insertSort<T>(_ elements: [T]) -> [T] where T: Comparable {
    var array = elements
    guard array.count > 1 else {
        return array
    }
    for i in 1..<array.count {
        let value = array[i]
        var j = i - 1
        //查找要插入的位置
        for p in (0...j).reversed() {
            if array[p] > value {
                array[p+1] = array[p]//移动数据
            } else {
                break
            }
        }
        array[j+1] = value// 插入数据
    }
    return array
}

///选择排序
func selectionSort<T>(_ elements: [T]) -> [T] where T: Comparable {
    var array = elements
    guard array.count > 1 else {
        return array
    }

    for i in 0..<array.count {
        var minValue = array[i]
        var minIndex = i
        //查找未排序区的最小值的索引minIndex
        for j in i..<array.count {
            if array[j] < minValue {
                minValue = array[j]
                minIndex = j
            }
        }
        ///交换i和minIndex
        array.swapAt(i, minIndex)
    }
    return array
}
