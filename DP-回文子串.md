#### [647. 回文子串](https://leetcode.cn/problems/palindromic-substrings/)

给你一个字符串 `s` ，请你统计并返回这个字符串中 **回文子串** 的数目。

**回文字符串** 是正着读和倒过来读一样的字符串。

**子字符串** 是字符串中的由连续字符组成的一个序列。

具有不同开始位置或结束位置的子串，即使是由相同的字符组成，也会被视作不同的子串。

 

**示例 1：**

```
输入：s = "abc"
输出：3
解释：三个回文子串: "a", "b", "c"
```

**示例 2：**

```
输入：s = "aaa"
输出：6
解释：6个回文子串: "a", "a", "a", "aa", "aa", "aaa"
```

 

**提示：**

- `1 <= s.length <= 1000`
- `s` 由小写英文字母组成



#### 二维数组-从下向上从左向右遍历

`var dp = [[Bool]](repeating: [Bool](repeating: false, count: chars.count), count: chars.count)`

```swift
func countSubstrings(_ s: String) -> Int {
        //定义二维数组dp[i][j] 从区间 i 到 j 的子串是回文子串
        // 递推公式：dp[i][j] = dp[i + 1][j - 1]，所以我们要保证dp[i+1][j-1]一定是计算过的我们需要从下向上，从左往右遍历，而且保证必须保证j - i > 1
        // 初始化：dp[i][j]初始化为 false,当j - i <= 1时，代表字符串是一位和两位字符相同\
        var chars = Array(s)
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: chars.count), count: chars.count)
        var res = 0
        for i in stride(from: chars.count, through: 0, by: -1) {
            for j in i..<chars.count {
                if(chars[i] == chars[j]) {
                    if(j - i <= 1) {
                        dp[i][j] = true
                        res += 1
                    } else if(dp[i + 1][j - 1]) {
                        dp[i][j] = true
                        res += 1
                    }
                }
            }
        }
        return res
    }
```

