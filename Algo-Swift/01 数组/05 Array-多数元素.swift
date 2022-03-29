//
//  05Array-多数元素.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2021/9/28.
//  Copyright © 2021 KM. All rights reserved.
//

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    let newNums = nums.sorted()
    return newNums[newNums.count / 2]
}
