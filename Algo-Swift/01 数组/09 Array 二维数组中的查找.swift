//
//  09 Array 二维数组中的查找.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2021/10/1.
//  Copyright © 2021 KM. All rights reserved.
//

import Foundation

//在一个 n * m 的二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个高效的函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。

//限制：
//
//0 <= n <= 1000
//
//0 <= m <= 1000

func findTargeIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
    //从二维数组中查找 targe,因为该二维数组每一行和每一列递增,所以我们和最大的值比较
    // 如果 target 大于当前值, row--,如果 target 小于当前的值, col ++
    // 如果相等返回结果true,否则返回 false
    var row = 0, col = matrix[0].count - 1
    while row < matrix.count, col >= 0 {
        if target > matrix[row][col] {
            row += 1
        } else if target < matrix[row][col] {
            col -= 1
        } else {
            return true
        }
    }
    return false
}
