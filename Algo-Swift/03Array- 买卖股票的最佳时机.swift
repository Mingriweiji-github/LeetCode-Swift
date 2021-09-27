//
//  03数组 买卖股票的最佳时机.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2021/9/28.
//  Copyright © 2021 KM. All rights reserved.
//

import Foundation
/**
 1. 记录今天之前买入最小值
 2.计算[今天之前最小值买入,今天卖出的最大获利]
 3.比较[每天最大的获利,取最大值]
 */
func maxProfits(_ prices: [Int]) -> Int {
    var minValue: Int = prices[0], maxValue: Int = 0
    for current in prices {
        maxValue = max(maxValue, current - minValue)
        minValue = min(minValue, current)
    }
    return maxValue
}
