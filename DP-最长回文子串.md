#### [5. 最长回文子串](https://leetcode.cn/problems/longest-palindromic-substring/)

给你一个字符串 `s`，找到 `s` 中最长的回文子串。

 

**示例 1：**

```
输入：s = "babad"
输出："bab"
解释："aba" 同样是符合题意的答案。
```

**示例 2：**

```
输入：s = "cbbd"
输出："bb"
```

 

**提示：**

- `1 <= s.length <= 1000`
- `s` 仅由数字和英文字母组成





#### 解题思路

对于 字符串 s , 长度为 n, 我们定义 一个 dp 数组,大小为 n * n

**dp[i] [j] 则表示 s[i,j] 区间 的子串 是否是回文串，存储的是 布尔值。**

**其中 i <= j,并且 我们让 i 作为 横行， j 作为纵向**

**如果 s[i,j] 的长度 <= 2 时，我们只需要判断两个字符是否相等即可,也就是 s[i] 是否等于 s[j]， 因此 dp[i] [j] = (s[i] == s[j])。**

**如果 s[i,j] 的长度 大于 2 时， 我们需要判断内部子串，将左右长度都缩小1位，也就是 s[i+1,j-1]**

**，如果 s[i+1,j-1] 是回文串，那么 s[i] 等于 s[j],则 s[i,j] 是回文串。**

** 因此，dp[i] [j] = dp[j+1] [j-1] && (s[i]==s[j])**

1. 动态规划 (二维数组)
为了实现我们的效果，我们需要知道左下角的数据，所以我们可以尝试 从后往前面推导 , 顺序是 从左到右，从下到上。

```swift
func longestPalindrome(_ s: String) -> String {
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
  // 记录回文子串起始位置和最大长度,最大回文子串 = chars[begin..<begin+maxL]
        var begin = 0, maxL = 0
        var chars = Array(s)
        for i in (0..<s.count).reversed() { // 从下向上
            for j in i..<s.count { // 从左向右
                if(chars[i] == chars[j] && (j - i <= 1 || dp[i + 1][j - 1])) {
                    dp[i][j] = true
                }
                if(dp[i][j] && (j - i + 1 > maxL)) {
                    maxL = j - i + 1
                    begin = i
                }
            }
        }
        return String(chars[begin..<begin + maxL])
    }
```

