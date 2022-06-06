#### [394. 字符串解码](https://leetcode.cn/problems/decode-string/)

给定一个经过编码的字符串，返回它解码后的字符串。

编码规则为: `k[encoded_string]`，表示其中方括号内部的 `encoded_string` 正好重复 `k` 次。注意 `k` 保证为正整数。

你可以认为输入字符串总是有效的；输入字符串中没有额外的空格，且输入的方括号总是符合格式要求的。

此外，你可以认为原始数据不包含数字，所有的数字只表示重复的次数 `k` ，例如不会出现像 `3a` 或 `2[4]` 的输入。

 

**示例 1：**

```
输入：s = "3[a]2[bc]"
输出："aaabcbc"
```

**示例 2：**

```
输入：s = "3[a2[c]]"
输出："accaccacc"
```

**示例 3：**

```
输入：s = "2[abc]3[cd]ef"
输出："abcabccdcdcdef"
```

**示例 4：**

```
输入：s = "abc3[cd]xyz"
输出："abccdcdcdxyz"
```

 

**提示：**

- `1 <= s.length <= 30`
- `s` 由小写英文字母、数字和方括号 `'[]'` 组成
- `s` 保证是一个 **有效** 的输入。
- `s` 中所有整数的取值范围为 `[1, 300]` 



> 行用时：4 ms, 在所有 Swift 提交中击败了80.00%的用户
>
> 内存消耗：14 MB, 在所有 Swift 提交中击败了80.00%的用户
>
> 通过测试用例：34 / 34



```swift
class Solution {
    func decodeString(_ s: String) -> String {
        // 辅助栈法
        // 1.当 c 为字符串[时：倍数 muti 和临时字符结果res分别放入栈中，这里可以用元组
        // 2.当 c 为字符串]时：出栈得到 lastString + lastMuti 倍临时字符res
        // 3.当 c 为数字时:记录到 muti 上
        // 4.当 c 是普通字符串: 直接加入临时结果 res 中
        var stack = [(Int, String)]()
        var res = "", muti = 0
        for c in s {
            switch c {
                case "[": 
                stack.append((muti, res))
                muti = 0
                res = ""
                case "]":
                 if let (lastMuti, lastString) = stack.popLast() {
                     res = lastString + String(repeating: res, count: lastMuti)
                 }
                case let x where c.isWholeNumber:
                    if let v = c.wholeNumberValue {
                        muti = muti * 10 + v
                    }
                default:
                    res.append(c)
            }
        }
        return res
    }
}
```

