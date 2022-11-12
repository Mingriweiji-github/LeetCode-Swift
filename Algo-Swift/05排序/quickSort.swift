//
//  quickSort.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/25.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
///快速排序是原地排序，也是递归实现 时间复杂度 O(nlogn) ，但快速排序不是稳定排序:https://github.com/andyRon/swift-algorithm-club-cn/tree/master/Quicksort
/*
 归并排序虽然是稳定的、时间复杂度为 O(nlogn) 的排序算法，但是它是非原地排序算法。

 归并之所以是非原地排序算法，主要原因是合并函数无法在原地执行。
 
 快速排序通过设计巧妙的原地分区函数，可以实现原地排序，解决了归并排序占用太多内存的问题。

  1 直接递归：
 1、设置中间位置元素为轴点元素pivot
 2、分区：less equal more
 3、递归合并分区
 
    2 分区法
  1 Lomuto分区法:是用数组最后一个元素作为基准元素对数组分区，区域为[low...p-1] [p+1...high]，然后递归调用quickLomutoSort分别对左右区排序，一直到数组有序

  2 Hoare分区：选择数组的first元素作为基准，数组划分区域为[low...p] [p+1...high]，然后递归调用quickSortHoare分别对左右区排序，一直到数组有序

  3 荷兰国旗分区：将前部和后部各排在数组的前边和后边，中部自然就排好了,分区函数返回(p, q)

  
  
 */
func quickSort<T: Comparable>(_ array: [T]) -> [T]{
    guard array.count > 0 else { return [] }
    let pivot = array[array.count / 2]

    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let more = array.filter { $0 > pivot }

    return quickSort(less) + equal + quickSort(more)
}

/*
 1、从序列中选择中轴点pivot（假设选择位置为0的元素）
 2、利用pivot中轴点把序列分成两个子序列
 3、分别对左右子序列递归进行快速排序，直到元素不能分割位置
   快速排序的本质是把每一个元素都转换成中轴点。
 */
//设置两个标志位begin和end分别指向这个数组的开始和末尾，然后用一个标志位current从头开始进行遍历：
//1）若遍历到的current < pivot，于是就和begin位置进行交换，然后current向前进，begin也向前进（表示前边的已经都排好了）。
//2）若遍历到current == pivot，则说明它一定属于中部，根据总思路，中部的我们都不动，然后current向前进。
//3）若遍历到current > pivot，则说明它一定属于后部，于是就和end位置进行交换，由于交换完毕后current指向的可能是属于前部的，若此时current前进则会导致该位置不能被交换到前部，所以此时current不前进。   end向后退1。
//4) 返回分区（begin, end）
func partation(_ nums: inout [Int], _ low: Int, _ high: Int, _ pivotIndex: Int) -> (Int, Int) {
    var begin = low, end = high
    var cur = low, pivot = nums[pivotIndex]
    while cur <= end {
        if nums[cur] < pivot {
            nums.swapAt(begin, cur)
            begin += 1
            cur += 1
        } else if nums[cur] > pivot {
            nums.swapAt(cur, end)
            end -= 1
        } else {
            cur += 1
        }
    }
    return (begin, end)
}
func quickSort(_ nums: inout [Int], _ low: Int, _ high: Int) {
    if low < high {
        let pivotIndex = Int.random(in: low...high)
        let (l, r) = partation(&nums, low, high, pivotIndex)
        quickSort(&nums, low, l - 1)
        quickSort(&nums, r + 1, high)
    }
}
func sortArray(_ nums: [Int]) -> [Int] {
    var array = nums
    quickSort(&array, 0, array.count - 1)
    return array
}
