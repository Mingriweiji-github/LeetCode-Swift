#### [53. Maximum Subarray](https://leetcode.cn/problems/maximum-subarray/)



Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

A subarray is a contiguous part of an array.

#### Example 1:

Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.

#### Example 2:

Input: nums = [1]
Output: 1

#### Example 3:

Input: nums = [5,4,-1,7,8]
Output: 23

#### Constraints:

1 <= nums.length <= 105
-104 <= nums[i] <= 104

 

Follow up: If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.



来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/maximum-subarray
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。



#### [题解](https://leetcode.cn/problems/maximum-subarray/solution/dong-tai-gui-hua-fen-zhi-fa-python-dai-ma-java-dai/)

![](https://pic.imgdb.cn/item/628806cf0947543129a9587e.jpg)

```swift
// 解题思路
// 动态规划 dp[i] = dp[i-1] + nums[i]; dp[i] = nums[i]
func maxSubArray(_ nums: [Int]) -> Int {
        // 最大子数组和，我们用动态规划的思路
        // 如果 count = 0 return 0
  
        // 定义 dp 数组，
        // 初始化dp[0]
        // 使用变量maxNum记录最大值

        // 遍历 nums
        // 如果dp[i-1]大于 0，我们的dp[i]就是dp[i-1]和 nums[i]的和

        // 最后返回最大值
}
```

> 执行用时：640 ms, 在所有 Swift 提交中击败了71.31%的用户
>
> 内存消耗：18.2 MB, 在所有 Swift 提交中击败了36.06%的用户
>
> 通过测试用例：209 / 209

```swift
// 动态规划 dp[i] = dp[i-1] + nums[i]; dp[i] = nums[i]
func maxSubArray(_ nums: [Int]) -> Int {
        // 最大子数组和，我们用动态规划的思路
        // 如果 count = 0 return 0
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
            if(maxNum < dp[i]) {
                maxNum = dp[i]
            }
        }
        // 最后返回最大值
        return maxNum
    }
```



#### 直接递归求和

> 执行用时：620 ms, 在所有 Swift 提交中击败了99.60%的用户
>
> 内存消耗：18.2 MB, 在所有 Swift 提交中击败了40.44%的用户
>
> 通过测试用例：209 / 209

```swift
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var result = nums.first!
        for num in nums {
            if sum > 0 {
                sum += num
            } else {
                sum = num
            }
            result = max(result, sum)
        }
        return result
    }
}
```



