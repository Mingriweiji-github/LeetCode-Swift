//
//  02Array.swift
//  Algo-Swift
//
//  Created by Li on 2021/9/26.
//  Copyright © 2021 KM. All rights reserved.
//


/**
 53. 最大子序和
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 示例 1：

 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 示例 2：
 输入：nums = [1]
 输出：1
 示例 3：
 输入：nums = [0]
 输出：0
 
 示例 4：
 输入：nums = [-1]
 输出：-1
 
 示例 5：
 输入：nums = [-100000]
 输出：-100000
  

 提示：

 1 <= nums.length <= 3 * 104
 -105 <= nums[i] <= 105

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/maximum-subarray
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

//func maxSubArray(_ nums: [Int]) -> Int {
//    // 动态规划? Java 写法
//    // 遍历数组
//    // 若前一个元素的值大于零,加到当前元素
//    // 返回修改过数组的最大值
//    // dp 状态转移方程: dp[i] = max[dp[i-1], 0] + num[i]
//    var res = nums[0]
//    var pre = 0
//
//    for i in 0..<nums.count - 1 {
//        pre = max(pre + nums[i], nums[i])
//        res = max(pre, res)
//    }
//    return res
//}

func maxSubArray(_ nums: [Int]) -> Int {
//    动态规划的是首先对数组进行遍历，当前最大连续子序列和为 sum，结果为 ans
//    如果 sum > 0，则说明 sum 对结果有增益效果，则 sum 保留并加上当前遍历数字
//    如果 sum <= 0，则说明 sum 对结果无增益效果，需要舍弃，则 sum 直接更新为当前遍历数字
//    每次比较 sum 和 ans的大小，将最大值置为ans，遍历结束返回结果
//    时间复杂度：O(n)
    var sum = 0, ans = nums[0]
    for num in nums {
        sum = sum > 0 ? sum + num : num
        ans = max(sum, ans)
    }
    return ans
}
