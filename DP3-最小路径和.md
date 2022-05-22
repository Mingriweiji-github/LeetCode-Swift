

![](https://pic.imgdb.cn/item/628903220947543129652f98.jpg)



#### 解题思路一：

> 我们可以使用二维数组dp[i] [j]表示从坐标(i,j)到达坐标最后元素(m-1, n-1)的最小路径和:
>
> 状态方程初始状态: dp[0] [0] = grid[0] [0]
> 状态方程中间状态: 
> 当 i = 0，j>0 表示只有一行只能向右移动此时最小路径只有一条: dp[0] [j] = dp[0] [j-1] + grid[i] [j]
> 当 j=0, i> 0 表示只有一列，只能向下移动此时的最小路径只有: dp[i] [0] = dp [i -1] [0] + grid[i] [0]
>
> 当 i> 0, j>0表示多行多列的情况: dp[i] [j] = min(dp[i-1] [j], dp[i] [j - 1]) + grid[i] [j]
>
> 最后二维数组dp[m-1] [n-1]就是我们要的最后元素的最小路径和



时间复杂度分析: 

- 时间复杂度： O(mn) 遍历整个矩阵一次
- 空间复杂度:    O(mn) 需要额外空间二维数组


> 执行结果：添加备注
>
> 执行用时：48 ms, 在所有 Swift 提交中击败了18.94%的用户
>
> 内存消耗：14 MB, 在所有 Swift 提交中击败了93.94%的用户
>
> 通过测试用例：61 / 61

```swift
func minPathSum(_ grid: [[Int]]) -> Int {
        var row = grid.count
        var column = grid[0].count
        var dp = grid
        dp[0][0] = grid[0][0]

        for i in 0..<row {
            for j in 0..<column {
                if (i == 0 && j == 0)  {
                    continue;
                } else if (i == 0 && j > 0) {
                    dp[0][j] = dp[0][j - 1] + grid[0][j]
                } else if (j == 0 && i > 0) {
                    dp[i][0] = dp[i - 1][0] + grid[i][0]
                } else {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
                }
            }
        }
        return dp[row - 1][column - 1]
    }
```



#### 解题思路二：一维数组

> 一维数组dp的大小和 row 相同接客：因为对于某种固定的状态，只需要考虑下方和右侧的结点，我们可以一行一行计算来节省空间复杂度

![](https://pic.imgdb.cn/item/628a4a3a094754312957c40c.jpg)

```swift
func minPathSum(_ grid: [[Int]]) -> Int {
        var row = grid.count
        var column = grid[0].count
        var dp = [Int](repeating: 0, count: grid[0].count)
        dp[0] = grid[0][0]

        for i in 1..<column {
            // 通过第一行赋值
            dp[i] = dp[i - 1] + grid[0][i]
        }

        for i in 1..<row {
            // 通过每行的第一个元素赋值
            dp[0] = grid[i][0] + dp[0]
            for j in 1..<column {
                //通过其他元素赋值
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
            }
        }
        return dp[column - 1]
    }
```

