//
//  LRU 缓存.swift
//  Algo-Swift
//
//  Created by 李昆明 on 2022/4/1.
//  Copyright © 2022 KM. All rights reserved.
//

import Foundation

/*
 LRUCache(int capacity) 以 正整数 作为容量 capacity 初始化 LRU 缓存
 int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
 void put(int key, int value) 如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组 key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lru-cache
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class LURCache {
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
            moveFirst(node)
            return node.value
        } else {
            return -1
        }
    }
    func moveFirst(_ node: DoubleNode) {
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
      如果关键字 key 已经存在，则变更其数据值 value ；如果不存在，则向缓存中插入该组 key-value 。如果插入操作导致关键字数量超过 capacity ，则应该 逐出 最久未使用的关键字。
     */
    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.value = value
            moveFirst(node)
        } else {
            add(key, value)
        }
    }
    func add(_ key: Int, _ value: Int) {
        if map.keys.count == capacity {
            deleteLast()
        }
        // 分别插入到链表和哈希表
        let node = DoubleNode(key, value)
        node.next = first
        first?.pre = node
        // 哈希表中的 value 存放的是 node
        map[key] = node
        
        // 临界区: last 为空
        if last == nil {
            last = node
        }
    }
    func deleteLast() {
        if let last = last {
            map.removeValue(forKey: last.key)
            self.last = last.pre
            self.last?.next = nil
        }
        // 临界区
        
    }
}
