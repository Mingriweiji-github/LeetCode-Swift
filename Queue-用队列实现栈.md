

#### [225. 用队列实现栈](https://leetcode.cn/problems/implement-stack-using-queues/)

难度简单531

请你仅使用两个队列实现一个后入先出（LIFO）的栈，并支持普通栈的全部四种操作（`push`、`top`、`pop` 和 `empty`）。

实现 `MyStack` 类：

- `void push(int x)` 将元素 x 压入栈顶。
- `int pop()` 移除并返回栈顶元素。
- `int top()` 返回栈顶元素。
- `boolean empty()` 如果栈是空的，返回 `true` ；否则，返回 `false` 。

 

**注意：**

- 你只能使用队列的基本操作 —— 也就是 `push to back`、`peek/pop from front`、`size` 和 `is empty` 这些操作。
- 你所使用的语言也许不支持队列。 你可以使用 list （列表）或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。

 

**示例：**

```
输入：
["MyStack", "push", "push", "top", "pop", "empty"]
[[], [1], [2], [], [], []]
输出：
[null, null, null, 2, 2, false]

解释：
MyStack myStack = new MyStack();
myStack.push(1);
myStack.push(2);
myStack.top(); // 返回 2
myStack.pop(); // 返回 2
myStack.empty(); // 返回 False
```

 

**提示：**

- `1 <= x <= 9`
- 最多调用`100` 次 `push`、`pop`、`top` 和 `empty`
- 每次调用 `pop` 和 `top` 都保证栈不为空



> 执行用时：0 ms, 在所有 Swift 提交中击败了100.00%的用户
>
> 内存消耗：14 MB, 在所有 Swift 提交中击败了74.36%的用户
>
> 通过测试用例：16 / 16

```swift
class Queue {
    private var arr = [Int]()

    func push(_ x: Int) {
        arr.append(x)
    }
    func remove() -> Int {
        return arr.removeFirst() // 先进先出,所以 removeFirst
    }
    func isEmpty() -> Bool {
        return arr.isEmpty
    }
    func size() -> Int {
        return arr.count
    }
}
class MyStack {
    private var queue1 = Queue()
    private var queue2 = Queue()
    init() {

    }
    
    func push(_ x: Int) {
        queue1.push(x)
    }
    
    func pop() -> Int {
        var remove = -1
        while !queue1.isEmpty() {
            let first = queue1.remove()
            remove = first
            if queue1.isEmpty() { continue }
            queue2.push(first)
        }
        while !queue2.isEmpty() {
            queue1.push(queue2.remove())
        }
        return remove
    }
    
    func top() -> Int {
        var remove = -1
        while !queue1.isEmpty() {
            let f = queue1.remove()
            remove = f
            queue2.push(f)
        }
        while !queue2.isEmpty() {
            queue1.push(queue2.remove())
        }
        return remove
    }
    
    func empty() -> Bool {
        return queue1.isEmpty()
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * let obj = MyStack()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Bool = obj.empty()
 */
```

