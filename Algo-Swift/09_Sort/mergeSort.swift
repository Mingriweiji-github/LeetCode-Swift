//
//  mergeSort.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/25.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
///归并排序是稳定排序，但不是原地排序因为它需要额外的空间进行合并，空间复杂度是O(N)
///稳定排序是指当元素相同时，排序后依然保持排序之前的相对顺序。
///归并排序具体解释：https://github.com/andyRon/swift-algorithm-club-cn/tree/master/Merge%20Sort
/*
 归并排序的核心是合并：依次合并N个堆得数据

 1、在合并时，您需要两个索引来跟踪两个数组的进度。

 2、这是合并后的数组。 它现在是空的，但是你将在下面的步骤中通过添加其他数组中的元素构建它。

 3、这个while循环将比较左侧和右侧的元素，并将它们添加到orderedPile，同时确保结果保持有序。

 4、如果前一个while循环完成，则意味着leftPile或rightPile中的一个的内容已经完全合并到orderedPile中。此时，您不再需要进行比较。只需依次添加剩下一个数组的其余内容到orderedPile。
 */

func merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
    //1
    var l = 0, r = 0
    //2
    var mergeArr: [Int] = []
    //3
    while l < leftArray.count && r < rightArray.count {
        if leftArray[l] > rightArray[r] {
            mergeArr.append(rightArray[r])
            r += 1
        } else if leftArray[l] < rightArray[r] {
            mergeArr.append(leftArray[l])
            l += 1
        } else {
            mergeArr.append(leftArray[l])
            l += 1
            mergeArr.append(rightArray[r])
            r += 1
        }
    }
    //4
    while l < leftArray.count {
        mergeArr.append(leftArray[l])
        l += 1
    }
    while r < rightArray.count {
        mergeArr.append(rightArray[r])
        r += 1
    }
    return mergeArr
}
/*
 1、如果数组为空或包含单个元素，则无法将其拆分为更小的部分，返回数组就行。

 2、找到中间索引。

 3、使用上一步中的中间索引，递归地分割数组的左侧。

 4、递归地分割数组的右侧。

 5、最后，将所有值合并在一起，确保它始终排序。
 */
func mergeSort(_ array: Array<Int>) -> Array<Int> {
    //1
    guard array.count > 1 else {
        return array
    }
    //2
    let middle = array.count / 2
    //3
    let leftPart = mergeSort(Array(array[0..<middle]))
    //4
    let rightPart = mergeSort(Array(array[middle..<array.count]))
    //5
    return merge(leftPart, rightPart)
}
