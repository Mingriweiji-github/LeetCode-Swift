//
//  数组2.swift
//  Algo-Swift
//
//  Created by longhuadmin on 2020/11/30.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
class ArrayTwoSum {
    // 两边哈希 60ms
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        for (key, value) in nums.enumerated() {
            dict[value] = key
        }
        for (index, value) in nums.enumerated() {
            let res = target - value
            if dict.keys.contains(res),
               index != dict[res] {
                return [index, dict[res]!]
            }
        }
        return []
    }
    // 两边哈希 48ms defeat 49.5% ;13.6MB defeat 76%
    func twoSum2 (_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()
        for (index, n) in nums.enumerated() {
            let expect = target - n
            if let i = dic[expect], i != index {
                return [i, index]
            }
            dic[n] = index
        }
        return []
    }
}
