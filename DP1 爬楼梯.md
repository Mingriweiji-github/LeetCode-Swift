### 动态规划-1爬楼梯

#### [70. Climbing Stairs](https://leetcode.cn/problems/climbing-stairs/)

You are climbing a staircase. It takes n steps to reach the top.

Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

##### Example 1:


> Input: n = 2
> Output: 2
> Explanation: There are two ways to climb to the top.
>
> 1. 1 step + 1 step
> 2. 2 steps



#### Example 2:

> Input: n = 3
> Output: 3
> Explanation: There are three ways to climb to the top.
>
> 1. 1 step + 1 step + 1 step
> 2. 1 step + 2 steps
> 3. 2 steps + 1 step


Constraints:

**1 <= n <= 45**

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/climbing-stairs
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

> 执行用时：0 ms, 在所有 Swift 提交中击败了100.00%的用户
>
> 内存消耗：13.2 MB, 在所有 Swift 提交中击败了80.16%的用户
>
> 通过测试用例：45 / 45

```swift
func climbStairs(_ n: Int) -> Int {
        // 边界值处理
        if n < 3 { return n }
        // 使用数组 dp 存储每一级台阶的爬法数量
        // 由于后面初始化 dp[1] 和 dp[2] 
        // 为了让当 n = 0 时不越界，保证 dp[1] 和 dp[2] 都有值
        // 所以 dp 的长度为 n + 2
        var dp = [Int](repeating: 0, count: n + 2)

        // 初始化 dp[1], dp[2]
        dp[1] = 1
        dp[2] = 2
        // 从 3 开始到n计算 dp[3]到dp[n]
        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        // 最后返回 dp[n]
        return dp[n]
    }
```

