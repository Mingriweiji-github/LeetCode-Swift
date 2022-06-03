#### [541. Reverse String II](https://leetcode.cn/problems/reverse-string-ii/)

Given a string `s` and an integer `k`, reverse the first `k` characters for every `2k` characters counting from the start of the string.

If there are fewer than `k` characters left, reverse all of them. If there are less than `2k` but greater than or equal to `k` characters, then reverse the first `k` characters and leave the other as original.

 

**Example 1:**

```
Input: s = "abcdefg", k = 2
Output: "bacdfeg"
```

**Example 2:**

```
Input: s = "abcd", k = 2
Output: "bacd"
```

 

**Constraints:**

- `1 <= s.length <= 104`
- `s` consists of only lowercase English letters.
- `1 <= k <= 104`



给定一个字符串 s 和一个整数 k，从字符串开头算起，每计数至 2k 个字符，就反转这 2k 字符中的前 k 个字符。

如果剩余字符少于 k 个，则将剩余字符全部反转。
如果剩余字符小于 2k 但大于或等于 k 个，则反转前 k 个字符，其余字符保持原样。


示例 1：

输入：s = "abcdefg", k = 2
输出："bacdfeg"
示例 2：

输入：s = "abcd", k = 2
输出："bacd"


提示：

1 <= s.length <= 104
s 仅由小写英文组成
1 <= k <= 104

来源：力扣（LeetCode）
链接：https://leetcode.cn/problems/reverse-string-ii
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。



#### Swift双指针：每次间隔 2*k,确定左右指针l, r

```swift
class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
         let count = s.count
         var chars = Array(s)
         for i in stride(from: 0, to: count, by: 2 * k) {
             var l = i, r = min(count, i + k) - 1
             while l < r {
                 (chars[l], chars[r]) = (chars[r], chars[l])
                 l += 1
                 r -= 1
             }
         }
         return String(chars)
    }
}
```

