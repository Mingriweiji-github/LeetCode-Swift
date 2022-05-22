#### [3. 无重复字符的最长子串](https://leetcode.cn/problems/longest-substring-without-repeating-characters/)

给定一个字符串 `s` ，请你找出其中不含有重复字符的 **最长子串** 的长度。

#### 示例 1

```
输入: s = "abcabcbb"
输出: 3 
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
```

#### 示例 2

```
输入: s = "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
```

#### 示例 3

> 输入: s = "pwwkew"
> 输出: 3
> 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
>      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。



**提示：**

- `0 <= s.length <= 5 * 104`
- `s` 由英文字母、数字、符号和空格组成

#### 暴力解法：

curStr数组做临时的存储，当碰到重复字符，删除此字符在数组之前所有字符，包括本身。

每次需要重复判断下是否是最大长度

```swift
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if(s == ""){
            return 0
        }
        var maxStr = String()
        var curStr = String()
        for char in s{
            while curStr.contains(char) {
                curStr.remove(at: curStr.startIndex)
            }
            curStr.append(char)
            if(curStr.count > maxStr.count){
                maxStr = curStr
            }
        }
        return maxStr.count
    }
}
```

**滑动窗口原理（目前最优）**
窗口法，区间取值;

- 右区间(end)值恒增加(向右走);
- 左区间(start)值停留，若出现相等则取下一位(end + 1)
- 最后返回区间长度(maxLength)

```swift
func lengthOfLongestSubstring(_ s: String) -> Int {
        var start = 0
        var end = 0
        var maxLength = 0
        var dict: [Character: Int] = [:]
        for item in s {
            if let pre = dict[item] {
                start = max(pre + 1, start)
            }
            dict[item] = end

            maxLength = max(end - start + 1, maxLength)

            end += 1 // 注意 end的位置
        }
        return maxLength
}
```



> 执行用时：12 ms, 在所有 Swift 提交中击败了84.58%的用户
>
> 内存消耗：14.1 MB, 在所有 Swift 提交中击败了87.38%的用户
>
> 通过测试用例：987 / 987

```swift
func lengthOfLongestSubstring(_ s: String) -> Int {
        var start = 0
        var maxLength = 0
        var dict: [Character: Int] = [:]
        for (index, char) in s.enumerated() {
            // 如果哈希表中已经存在字符previous,更新 start 的值为previous，这里如果是多次重复字符串如"abbba"，start 需要不断的更新
            // 哈希表中不存在字符，更新哈希表中不重复字符的下标
            // 最后最长子串就是 index-start-1和记录值maxLength的较大值

            if let previous = dict[char] {
                start = max(previous + 1, start)
            }
            dict[char] = index
            maxLength = max(maxLength, index - start + 1)
        }
        return maxLength
}
```

> 执行用时：4 ms, 在所有 Swift 提交中击败了99.77%的用户
>
> 内存消耗：14.1 MB, 在所有 Swift 提交中击败了84.11%的用户
>
> 通过测试用例：987 / 987