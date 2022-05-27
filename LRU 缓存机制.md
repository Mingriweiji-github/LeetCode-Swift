#### 请你设计并实现一个满足  LRU (最近最少使用) 缓存 约束的数据结构。

实现 LRUCache 类：
- LRUCache(int capacity) 以 正整数 作为容量 capacity 初始化 LRU 缓存
- `int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。`
- `void put(int key, int value) `
  - `如果关键字 key 已经存在，则变更其数据值 value ；`
  - `如果不存在，则向缓存中插入该组 key-value 。`
  - `如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。`
  - 
  **函数 get 和 put 必须以 O(1) 的平均时间复杂度运行。**

 

#### 示例：

> 输入
> ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
> [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
> 输出
> [null, null, null, 1, null, -1, null, -1, 3, 4]
>
> 解释
> LRUCache lRUCache = new LRUCache(2);
> lRUCache.put(1, 1); // 缓存是 {1=1}
> lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
> lRUCache.get(1);    // 返回 1
> lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
> lRUCache.get(2);    // 返回 -1 (未找到)
> lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
> lRUCache.get(1);    // 返回 -1 (未找到)
> lRUCache.get(3);    // 返回 3
> lRUCache.get(4);    // 返回 4


提示：



> 1 <= capacity <= 3000
> 0 <= key <= 10000
> 0 <= value <= 105
> 最多调用 2 * 105 次 get 和 put



#### 分析一：我们可以通过维护一个有序的单链表来实现 LRU 缓存，链表尾部是我们最早访问的，当有新的数据访问时，我们先从头开始查询有序链表中是否存在

- 如果存在链表中，遍历链表得到最新节点，删除对应节点后，插入到链表的头部
- 如果链表中不存在
  - 如果此时缓存未满，将该节点插入到链表的头部
  - 如果此时缓存已经满了，将尾部节点删除，并将新数据插入到头部节点位置.

##### 时间复杂度分析: 由于我们每次都需要遍历完整的链表，所以访问的时间复杂度为 O(n)

#### 分析二：如果我们想实现时间复杂度为 O(1)的 话，我们就不能每次数据进来都重新遍历所有数据才获取到对应节点 node 的位置，再决定删除 node 还是移动 node 到链表的头部。因此我们需要借助一种数据结构:哈希表，利用哈希表我们可以实现 O（1）的时间复杂度获取到对应的结点的位置，然后操作节点。

> 双向链表存储键值的目的是为了，map满的时候，先删除尾部节点，再删除map容器键值对，从双线链表对应到map容器需要键值

![](https://tva1.sinaimg.cn/large/e6c9d24egy1h0tvnahy0aj219i0u0jtq.jpg)

#### 视频讲解

https://leetcode-cn.com/problems/lru-cache/solution/shi-pin-jiang-jie-qing-xi-zhi-guan-by-ge-zj3c/

> 执行用时：1276 ms, 在所有 Swift 提交中击败了38.24%的用户
>
> 内存消耗：30.9 MB, 在所有 Swift 提交中击败了45.22%的用户
>
> 通过测试用例：22 / 22

```swift

class LRUCache {
var capacity: Int
    // 构建双向链表
    class DoubleNode {
        var key: Int
        var value: Int
        var pre: DoubleNode?
        var next: DoubleNode?
        init(_ key: Int, _ value: Int) {
            self.key = key
            self.value = value
        }
    }
    // 哈希表
    var map = [Int: DoubleNode]()
    var first: DoubleNode?
    var last: DoubleNode?
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    // 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
    func get(_ key: Int) -> Int {
        if let node = map[key] {
            move(node)
            return node.value
        } else {
            return -1
        }
    }
    func move(_ node: DoubleNode) {
        // 临界点1
        if node === first {
            return
        }
        // 临界点 2
        if node === last {
            last = last?.pre
        }
        // 删除节点
        node.pre?.next = node.next
        node.next?.pre = node.pre
        // 移动到首位节点位置
        node.next = first
        first?.pre = node
        // first记录 node
        first = node
    }
    /**
      如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组 key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。
     */
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.value = value
            move(node)
        } else {
            add(key, value)
        }
    }
    func add(_ key: Int, _ value: Int) {
        if map.keys.count == capacity {
            delete()
        }
        // 分别插入到链表和哈希表
        let node = DoubleNode(key, value)
        node.next = first
        first?.pre = node
        
        // 注意这里
        first = node 

        // 哈希表中的 value 存放的是 node
        map[key] = node
        // 临界区: last 为空
        if last == nil {
            last = node
        }
        
    }
    func delete() {
        if let last = last {
            map.removeValue(forKey: last.key)
            self.last = last.pre
            self.last?.next = nil
            if first === last {
                first = nil
            }
        }        
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

```



