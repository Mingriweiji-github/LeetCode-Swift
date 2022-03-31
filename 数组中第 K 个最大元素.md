### 数组中第 K 个最大元素

[LeetCode215](https://leetcode-cn.com/problems/kth-largest-element-in-an-array)

 

> 给定整数数组 nums 和整数 k，请返回数组中第 k 个最大的元素。
>
> 请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。
>
> 示例 1:
>
> 输入: [3,2,1,5,6,4] 和 k = 2
> 输出: 5
> 示例 2:
>
> 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
> 输出: 4


提示：

1 <= k <= nums.length <= 104
-104 <= nums[i] <= 104



### 解题思路

![](https://pic.imgdb.cn/item/624557f327f86abb2a251ef4.jpg)





---

#### Swift 暴力求解



```swift
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        return nums.sorted { return $0 > $1}[k - 1]
    }
}
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // 别忘了是 k - 1 而不是 k
        return nums.sorted(by: >)[k - 1]
    }
}
```

时间复杂度 O(nlogn) 快速排序的时间复杂度
空间复杂度 O(logn) 快速排序的空间复杂度

#### Swift 快排解法一

```swift
class Solution {

    func partion(_ nums:inout [Int],_ first:Int,_ last:Int) -> Int{

        //优化一下 不然取中位数，性能会倒退 取前中后三个数，然后排列出中位数
        // var min = first;
        // var max = last-1;
        // var middle = last;
        // if(nums[min] < nums[middle]){
        //     nums.swapAt(min,middle)
        // }
        // if(nums[middle] < nums[max]){
        //     nums.swapAt(middle,max)
        // }
        // if(nums[min] < nums[middle]){
        //     nums.swapAt(min,middle)
        // }

        var random = Int.random(in:first...last);
        nums.swapAt(random,last)
        var pivot = first;
        for i in first...last-1 {
            if(nums[i] < nums[last]){
                nums.swapAt(i,pivot)
                pivot += 1;
            }
        }
        nums.swapAt(pivot,last)
        return pivot
    }
    func quickSearch(_ nums:inout [Int],_ first:Int,_ last:Int,_ search:Int) -> Int{
        if(first < last){
            var pivot = partion(&nums,first,last)

            if pivot == search{
                return nums[pivot]
            }else if(pivot < search){
                return  quickSearch(&nums,pivot+1,last,search)
            }else{
                return  quickSearch(&nums,first,pivot-1,search)
            }
        }else{
            return nums[first]
        }
    }
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var arr = nums;
        return quickSearch(&arr,0,arr.count - 1,arr.count - k);
    }
}
```



#### Swift 堆排序

```swift
class Solution {
 2     func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
 3       var newNums = nums
 4         buildMaxHead(&newNums)//建最大堆
 5         for i in ((newNums.count - k - 1)..<newNums.count).reversed() {
 6             swap(&newNums, 0, i)
 7             if i == newNums.count - k {
 8                 return newNums[i]
 9             }
10             headify(&newNums, 0, i)
11         }
12         return 0
13     }
14     //MARK: 堆排序
15     func headSort(_ nums:inout [Int]) {
16         buildMaxHead(&nums)
17         for i in (1..<nums.count).reversed() {
18             swap(&nums, i, 0)
19             headify(&nums, 0, i)
20         }
21     }
22     //建最大堆
23     func buildMaxHead(_ nums:inout [Int]) {
24         for i in (0...nums.count/2).reversed() {
25             headify(&nums, i,nums.count)
26         }
27     }
28     //堆调整
29     func headify(_ nums:inout [Int], _ index: Int, _ length: Int) {
30         let leftChild = index * 2 + 1 // index节点的左孩子节点
31         let rightChild = index * 2 + 2 //index节点的右孩子节点
32         var largertIndex = index //节点与左右孩子的最大值
33         if leftChild < length && nums[leftChild] > nums[largertIndex] {
34             largertIndex = leftChild
35         }
36         if rightChild < length && nums[rightChild] > nums[largertIndex] {
37             largertIndex = rightChild
38         }
39         //如果交换了
40         if largertIndex != index {
41             swap(&nums, largertIndex, index)//交换节点值
42             headify(&nums, largertIndex,length)//调整变动的节点
43         }
44     }
45         func swap(_ nums:inout [Int],_ i:Int,_ j: Int) {
46         let temp = nums[i]
47         nums[i] = nums[j]
48         nums[j] = temp
49     }
50 }
```



---

Java 版本参考作者：liweiwei1419 [链接](https://leetcode-cn.com/problems/kth-largest-element-in-an-array/solution/partitionfen-er-zhi-zhi-you-xian-dui-lie-java-dai-/)



#### Java方法一：暴力解法

参考代码 1：



##### Java

    public int findKthLargest(int[] nums, int k) {
        int len = nums.length;
        Arrays.sort(nums);
        return nums[len - k];
    }
}
复杂度分析：

时间复杂度：O(NlogN)，这里 N 是数组的长度，`算法的性能消耗主要在排序，JDK 默认使用快速排序，因此时间复杂度为 (NlogN)；`

空间复杂度：O(logN)，这里认为编程语言使用的排序方法是`「快速排序」，空间复杂度为递归调用栈的高度，为 logN。`

`其实这道问题考察了「快速排序」的 partition 操作和数据结构「堆」的应用，方法二和方法三分别介绍了这两种方法。`



#### Java方法二：减而治之（逐渐缩小问题规模）

注意：随机化切分元素。快速排序虽然快，但是在**遇到特殊测试用例（顺序数组或者逆序数组）的时候，递归树会退化成链表，时间复杂度会变成O($N^2$)。**

我们在学习「快速排序」的时候，会学到 partition（切分），通过 partition 操作使得：

对于某个下标 j，nums[j] 已经排定，即 nums[j] 经过 partition（切分）操作以后会放置在它「最终应该放置的地方」。而且：

- nums[left] 到 nums[j - 1] 中的所有元素都不大于 nums[j]；
- nums[j + 1] 到 nums[right] 中的所有元素都不小于 nums[j]。



![](https://pic.leetcode-cn.com/1628219309-XjJtIn-image.png)

参考代码 2：

#### Java

```java
public class Solution {

    public int findKthLargest(int[] nums, int k) {
        int len = nums.length;
        int left = 0;
        int right = len - 1;

        // 转换一下，第 k 大元素的下标是 len - k
        int target = len - k;

        while (true) {
            int index = partition(nums, left, right);
            if (index == target) {
                return nums[index];
            } else if (index < target) {
                left = index + 1;
            } else {
                right = index - 1;
            }
        }
    }

    /**
     * 对数组 nums 的子区间 [left..right] 执行 partition 操作，返回 nums[left] 排序以后应该在的位置
     * 在遍历过程中保持循环不变量的定义：
     * nums[left + 1..j] < nums[left]
     * nums(j..i) >= nums[left]
     *
     * @param nums
     * @param left
     * @param right
     * @return
     */
    public int partition(int[] nums, int left, int right) {
        int pivot = nums[left];
        int j = left;
        for (int i = left + 1; i <= right; i++) {
            if (nums[i] < pivot) {
                // j 的初值为 left，先右移，再交换，小于 pivot 的元素都被交换到前面
                j++;
                swap(nums, j, i);
            }
        }
        // 在之前遍历的过程中，满足 nums[left + 1..j] < pivot，并且 nums(j..i) >= pivot
        swap(nums, j, left);
        // 交换以后 nums[left..j - 1] < pivot, nums[j] = pivot, nums[j + 1..right] >= pivot
        return j;
    }

    private void swap(int[] nums, int index1, int index2) {
        int temp = nums[index1];
        nums[index1] = nums[index2];
        nums[index2] = temp;
    }
}

```


> 注意：本题必须随机初始化 pivot 元素，否则通过时间会很慢，因为测试用例中有极端测试用例。为了应对极端测试用例，使得递归树加深，可以在循环一开始的时候，随机交换第 11 个元素与它后面的任意 11 个元素的位置；

参考代码 3：

#### Java



```java
import java.util.Random;

public class Solution {
private static Random random = new Random(System.currentTimeMillis());

public int findKthLargest(int[] nums, int k) {
    int len = nums.length;
    int target = len - k;
    int left = 0;
    int right = len - 1;
    while (true) {
        int index = partition(nums, left, right);
        if (index < target) {
            left = index + 1;
       
        } else if (index > target) {
            right = index - 1;
        } else {
            return nums[index];
        }
    }
}

// 在区间 nums[left..right] 区间执行 partition 操作
private int partition(int[] nums, int left, int right) {
    // 在区间随机选择一个元素作为标定点
    if (right > left) {
        int randomIndex = left + 1 + random.nextInt(right - left);
        swap(nums, left, randomIndex);
    }

    int pivot = nums[left];
    int j = left;
    for (int i = left + 1; i <= right; i++) {
        if (nums[i] < pivot) {
            j++;
            swap(nums, j, i);
        }
    }
    swap(nums, left, j);
    return j;
}

private void swap(int[] nums, int index1, int index2) {
    int temp = nums[index1];
    nums[index1] = nums[index2];
    nums[index2] = temp;
}
}
```
> 复杂度分析：
>
> 时间复杂度：O(N)，这里 N 是数组的长度，理由可以参考本题解下用户 @ZLW 的评论，需要使用主定理进行分析；
> 空间复杂度：O(1)，在逐渐缩小搜索区间的过程中只使用到常数个变量。
> 说明：可能有一部分朋友看到这道题有「递归」的写法，但是本题解采用的是在 while (true) 循环中，通过 left 与 right 向中间靠拢的方式逐步缩小搜索区间，因此没有使用递归调用栈（也无须使用递归调用栈），因此空间复杂度是 O(1)。



