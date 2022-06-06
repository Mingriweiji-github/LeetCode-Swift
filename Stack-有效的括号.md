#### [20. 有效的括号](https://leetcode.cn/problems/valid-parentheses/)

给定一个只包括 `'('`，`')'`，`'{'`，`'}'`，`'['`，`']'` 的字符串 `s` ，判断字符串是否有效。

有效字符串需满足：

1. 左括号必须用相同类型的右括号闭合。
2. 左括号必须以正确的顺序闭合。

 

**示例 1：**

```
输入：s = "()"
输出：true
```

**示例 2：**

```
输入：s = "()[]{}"
输出：true
```

**示例 3：**

```
输入：s = "(]"
输出：false
```

**示例 4：**

```
输入：s = "([)]"
输出：false
```

**示例 5：**

```
输入：s = "{[]}"
输出：true
```

 

**提示：**

- `1 <= s.length <= 104`
- `s` 仅由括号 `'()[]{}'` 组成



> 执行用时：4 ms, 在所有 Swift 提交中击败了67.44%的用户
>
> 内存消耗：13.9 MB, 在所有 Swift 提交中击败了78.68%的用户
>
> 通过测试用例：91 / 91

#### 解法 :哈希表+栈

- 1.遇到左括号入栈
- 2.遇到右括号，如果刚好是在 stack的栈顶的话 出栈: // 栈顶元素和 右括号c刚好匹配： stack.last = hash[c] 
- 3.没有匹配到的直接判断 false
- 4.最后如果栈为空则栈中的括号是有小括号

```swift
func isValid(_ s: String) -> Bool {
    let hash: [Character: Character] = ["}": "{", ")": "(", "]": "["]
    var stack = [Character]()
    for c in s {
        if hash.values.contains(c) {// c是左括号
            stack.append(c)
        } else if let last = stack.last, last == hash[c] { // 栈顶元素和 右括号c刚好匹配： stack.last = hash[c] 
            stack.popLast()
        } else { // 其他情况
            return false
        }
    }
    return stack.isEmpty
}
```

