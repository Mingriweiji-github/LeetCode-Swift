#### [343. 整数拆分](https://leetcode.cn/problems/integer-break/)

难度中等837

给定一个正整数 `n` ，将其拆分为 `k` 个 **正整数** 的和（ `k >= 2` ），并使这些整数的乘积最大化。

返回 *你可以获得的最大乘积* 。

 

**示例 1:**

```
输入: n = 2
输出: 1
解释: 2 = 1 + 1, 1 × 1 = 1。
```

**示例 2:**

```
输入: n = 10
输出: 36
解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36。
```

 

**提示:**

- `2 <= n <= 58`



#### Swift-动态规划确定 dp[i], 从 1 到 i 遍历 j 要得到dp[i]的方式有两种:

- (i - j) *j直接乘积
- dp[i - j] * j 相当于先拆分(i - j)的最大成绩,然后和j乘积

```swift
class Solution {
    func integerBreak(_ n: Int) -> Int {
        // 注意验证边界值
        // 1.确定dp[i]数组的含义：定义整数i的最大乘积
        // 2.初始化 dp[0], dp[1], dp[2],正整数排除 0,1 不能拆分，所有我们初始化装填从dp[2] = 1 开始
        // 3.确定遍历方式和递推公式：j从 1 到 i - 1，dp[i] = max(dp[i], max(dp[i-j] * j, (i-j) * j))
        if(n < 4) { return n - 1 } 
        var dp: [Int] = Array(repeating:0, count: n + 1)
        dp[2] = 1
        for i in 3...n {
            for j in 1..<i {
                let m = max(dp[i - j] * j, (i - j) * j)
                dp[i] = max(dp[i], m)
            }
        }
        return dp[n]
    }
}
```

