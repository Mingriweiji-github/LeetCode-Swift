//
//  StackOnLinkedList.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/24.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
struct StackOnLinkedList<Element>: Stack {
    private var head = Node<Element>()

    var isEmpty: Bool { return head.next == nil }

    var size: Int {
        var count = 0
        var cur = head.next
        while cur != nil {
            count += 1
            cur = cur?.next
        }
        return count
    }

    var peek: Element? { return head.next?.value }

    func push(_ ele: Element) -> Bool {
        let node = Node(value: ele)
        node.next = head.next
        head.next = node
        return true
    }

    func pop() -> Element? {
        let node = head.next
        head.next = node?.next
        return node?.value
    }

}
