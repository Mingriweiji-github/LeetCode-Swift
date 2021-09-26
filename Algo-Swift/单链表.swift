//
//  SingleLinkedList.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/9.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/**
 Swift 链表定义
 */
class Node<T> {
    var value: T?
    var next: Node?

    init() {}
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else { return "\(String(describing: value))" }
        return "\(String(describing: value)) ->" + String(describing: next) + " "
    }
}
/**
单链表实现插入、删除、查找操作
*/


class List<Element: Equatable> {
    private var dummy = Node<Element>() //哨兵节点，类似java不存储数据
    var size: Int {
        var num = 0
        var temp = dummy.next
        while temp != nil {
            num += 1
            temp = temp!.next
        }
        return num
    }

    var isEmpty: Bool { return size > 0 }
    func node(with value: Element) -> Node<Element>? {
        var node = dummy.next
        while node != nil {
            if node!.value == value {
                return node
            }
            node = node!.next
        }

        return nil
    }

    func node(at index: Int) -> Node<Element>? {
        var num = 1
        var node = dummy.next
        while node != nil {
            if num == index {
                return node
            }
            node = node!.next
            num += 1
        }
        return nil
    }

    func insertHead(with node: Node<Element>) {
        node.next = dummy.next
        dummy.next = node
    }
    func insertHead(with value: Element) {
        let newNode = Node(value: value)
        insertHead(with: newNode)
    }
    func insert(after node: Node<Element>, newNode: Node<Element>) {
        newNode.next = node.next
        node.next = newNode
    }
    func insert(after node: Node<Element>, newValue: Element) {
        let newNode = Node(value: newValue)
        return insert(after: node, newNode: newNode)
    }
    func insert(before node: Node<Element>, newValue: Element) {
        let newNode = Node(value: newValue)
        return insert(before: node, newNode: newNode)

    }
    func insert(before node: Node<Element>, newNode: Node<Element>) {
        var lastNode = dummy
        var tempNode = dummy.next

        while tempNode != nil {
            newNode.next = tempNode
            lastNode.next = newNode
            break
        }
        lastNode = tempNode!
        tempNode = tempNode!.next
    }


    func delete(node: Node<Element>) {
        var lastNode = dummy
        var tempNode = dummy.next
        while tempNode != nil {
            if tempNode === node {
                lastNode.next = tempNode!.next
                break
            }

            lastNode = tempNode!
            tempNode = tempNode!.next
        }
    }


    func delete(valeu: Element) {
        var lastNode = dummy
        var tempNode = dummy.next
        while tempNode != nil {
            if tempNode!.value == valeu {
                lastNode.next = tempNode!.next
                break
            }

            lastNode = tempNode!
            tempNode = tempNode?.next
        }
    }
}
