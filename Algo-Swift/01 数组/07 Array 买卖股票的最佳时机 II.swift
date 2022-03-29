//
//  07 Array 买卖股票的最佳时机 II.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2021/9/28.
//  Copyright © 2021 KM. All rights reserved.
//

import Foundation
//定一个数组 prices ，其中 prices[i] 是一支给定股票第 i 天的价格。
//
//设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
//
//注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii



//执行用时：32 ms 在所有 Swift 提交中击败了71.94%的用户
//内存消耗：14 MB 在所有 Swift 提交中击败了90.00%的用户
//通过测试用例：200 / 200
func maxProfit2(_ prices: [Int]) -> Int {
    // 贪心算法思路:
    // 初始化最大利润值 maxValue
    // 只要第二天i 对应的价格大于前一天 i-1 对应的价格，我们就累加到 maxValue
    // 最大利润值就是 maxValue
    var maxValue = 0
    for i in 1..<prices.count {
        if prices[i] > prices[i - 1] {
            maxValue += prices[i] - prices[i - 1]
        }
    }
    return maxValue
}
