//
//  main.swift
//  Algo-Swift
//
//  Created by Seven on 2020/2/9.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation

print("Hello, World!")

//var colors = [2,0,2,1,1,0]
//setColors(&colors)
//print(colors)
//var color2 = [1,2,0]
//setColors(&color2)
//print(color2)

//let nums = [1,2,4,7,10,11]
//print(nums.sorted())
//let sort1 = subSort(nums)
//print(sort1)
//if nums == nums.sorted() {
//    print("Yes")
//} else {
//    print("NO")
//}
//
//let num4 = [-4,-1,0,3,10]

//let result4 = sortedSquares(num4)
//
//print(result4)
//
//print(isValid("[[]"))
//
//var list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
//let (p, q) = partationDutch(&list, low: 0, high: list.count - 1, pivotIndex: 2)
//print(p, q)
//quickSortDutch(&list, low: 0, high: list.count - 1)
//print(list)


//var linkList =  [1,3,5,2,8,1,0]
//linkList =  LinkedListSolution.reversePrintWithArray(linkList)
//print(linkList)

//let characters = "()"
//let stringSolution = StringSolution()
//print(stringSolution.isCharacterValid(characters))
//print(isValid(characters))
//
//// 青蛙 循环求余-大于Int64?
//print(Int32.min)
//print(Int32.max)
//print(Int64.max)
//print(Int64.min)

// 二叉树层序遍历输出二维数组
let fifth = TreeNode(15)
let seven = TreeNode(7)
let tweenty = TreeNode(20, fifth, seven)
let nine = TreeNode(9)
let root = TreeNode(3, nine, tweenty)
let res = BinaryTree().levelOrder(root)
print(res)
//[[3], [9, 20], [15, 7]]


// 最大岛屿面积 
var island =
    [[0,0,1,0,0,0,0,1,0,0,0,0,0],
     [0,0,0,0,0,0,0,1,1,1,0,0,0],
     [0,1,1,0,1,0,0,0,0,0,0,0,0],
     [0,1,0,0,1,1,0,0,1,0,1,0,0],
     [0,1,0,0,1,1,0,0,1,1,1,0,0],
     [0,0,0,0,0,0,0,0,0,0,1,0,0],
     [0,0,0,0,0,0,0,1,1,1,0,0,0],
     [0,0,0,0,0,0,0,1,1,0,0,0,0]]

print(maxAreaOfIsland(grid: &island))

// 链表
let listNode = ListNode(0,
                        ListNode(1,
                                 ListNode(2,
                                          ListNode(3,
                                                   ListNode(4, nil)))))


// 链表嵌套简写
indirect enum LinkedList<Element: Comparable> {
    case empty
    case node(Element, LinkedList<Element>)
}
let linkedList = LinkedList.node(1, .node(2, .node(3, .node(4, .empty))))

//func removing(_ element: Element) -> LinkedList<Element> {
//    guard case let .node(value, next) = self else { return .empty }
//}

