# Three Sum （三数之和）

**LeetCode 15**

- [英文版](https://leetcode.com/problems/3sum/)
- [中文版](https://leetcode-cn.com/problems/3sum/)

## 题目

给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。

注意：答案中不可以包含重复的三元组。

例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

满足要求的三元组集合为： [ [-1, 0, 1], [-1, -1, 2] ]

## 思路

1. 先对原数组排序
2. 从小到大遍历排序的数组
3. 在当前遍历下标的后面剩余数组中使用两边夹逼的方式查找两个数
4. 如果这两个数与当前下标的数之和等于 0，则存入结果数组
5. 否则继续查找



## Java解法

```java
public static int[] twoSum(int[] nums, int target) {
        Map <Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            int complete = target - nums[i];
            if (map.containsKey(complete)) {
                return new int[] { map.get(complete), i };
            }
            map.put(nums[i], i);
        }
        throw new IllegalArgumentException("No two sum solution");
    }
```

## Swift解法

### 两边哈希

```swift
// 两边哈希 60ms 23MB
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var map = [Int: Int]()
    for (key, value) in nums.enumerated() {
        map[value] = key
    }
    for (index, value) in nums.enumerated() {
        let res = target - value
        if map.keys.contains(res),
           index != map[res] {
            return [index, map[res]!]
        }
    }
    return []
}
```

### 一遍哈希

```swift

```

