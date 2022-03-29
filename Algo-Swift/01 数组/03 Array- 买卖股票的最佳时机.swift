//
//  03数组 买卖股票的最佳时机.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2021/9/28.
//  Copyright © 2021 KM. All rights reserved.
//

import Foundation

//给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
//
//你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
//返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock

/**
 // 解题思路
 // 通过记录最小值和最大值
 // 比较最大值和当前值-最小值，以及最小值和当前值的大小
 // 返回最大值
 */
func maxProfits(_ prices: [Int]) -> Int {
    var minValue: Int = prices[0], maxValue: Int = 0
    for current in prices {
        maxValue = max(maxValue, current - minValue)
        minValue = min(minValue, current)
    }
    return maxValue
}
