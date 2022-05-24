#### [53. 最大子数组和](https://leetcode.cn/problems/maximum-subarray/)



给你一个整数数组 `nums` ，请你找出一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

**子数组** 是数组中的一个连续部分。



**示例 1：**

```
输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
输出：6
解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
```

**示例 3：**

```
输入：nums = [5,4,-1,7,8]
输出：23
```

**提示：**

- `1 <= nums.length <= 105`
- `-104 <= nums[i] <= 104`



#### 暴力求解

```swift
func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var res = nums[0]
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            res = max(sum, res)
        }
        return res
    }
```



#### 动态规划解法:

```swift
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        // 最大子数组和，我们用动态规划的思路
        if(nums.count == 0) {return 0}
        // 定义 dp 数组，
        var dp = Array<Int>(repeating: 0, count: nums.count)
        // 初始化dp[0]
        dp[0] = nums[0]
        // 使用变量maxNum记录最大值
        var maxNum = dp[0]
        // 遍历 nums
        for i in 1..<nums.count {
            // 如果dp[i-1]大于 0，我们的dp[i]就是dp[i-1]和 nums[i]的和
            if(dp[i-1] > 0 ) {
                dp[i] = dp[i - 1] + nums[i]
            } else {
                dp[i] = nums[i]
            }
       
            maxNum = max(dp[i], maxNum)
        }
        // 最后返回最大值
        return maxNum
    }
}
```



