//
//  网格结构.swift
//  Algo-Swift
//
//  Created by longhuadmin on 2020/11/30.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation
/*
 LeetCode 463. Island Perimeter 岛屿的周长（Easy）
 
 LeetCode 200. Number of Islands 岛屿数量(Medium)
 LeetCode 695. Max Area of Island 岛屿的最大面积（Medium）
 
 LeetCode 827. Making A Large Island 最大人工岛（Hard）
 
 */
class Grid {
    // 判断坐标（r,c）是否在网格中
    func inArea(grid: [[Int]], r: Int, c: Int) -> Bool {
        return (0 <= r) && r < grid.count &&
               (0 <= c) && c < grid[0].count
    }
    // 岛屿DFS遍历: 搜索四个方向相邻的格子
    func gridDFS( grid: inout [[Int]], r: Int, c: Int) {
        // 坐标是否合法
        if !inArea(grid: grid, r: r, c: c) {
            return
        }
        // 不是岛屿直接返回
        if grid[r][c] != 1 {
            return
        }
        grid[r][c] = 2; // 将格子标记为【已经遍历】
        // 依次访问 上下左右四个相邻节点
        gridDFS(grid: &grid, r: r - 1, c: c)
        gridDFS(grid: &grid, r: r + 1, c: c)
        gridDFS(grid: &grid, r: r, c: c - 1)
        gridDFS(grid: &grid, r: r, c: c + 1)
    }
}

/*
 LeetCode 695. Max Area of Island 岛屿的最大面积（Medium）
 注意2020.11.30日 Swift提交审核不通过LeetCode编译 报错:Line 85: Char 46: error: passing value of type '[[Int]]' to an inout parameter requires explicit '&' in solution.swift let ret = Solution().maxAreaOfIsland(param_1)

 */
func maxAreaOfIsland(grid: inout [[Int]]) -> Int {
    var res = 0
    for r in 0..<grid.count {
        for c in 0..<grid[0].count {
            if grid[r][c] == 1 { // grid[r][c]表示陆地
                let a = area(grid: &grid, r: r, c: c)
                res = max(a, res)
            }
        }
    }
    return res
}
// 岛屿面积
func area(grid: inout [[Int]], r: Int, c: Int) -> Int {
    if !inArea(grid: grid, r: r, c: c) { // 岛屿
        return 0
    }
    if grid[r][c] != 1 { // 陆地
        return 0
    }
    grid[r][c] = 2 //已经遍历的陆地
    
    return 1
        + area(grid: &grid, r: r - 1, c: c)
        + area(grid: &grid, r: r + 1, c: c)
        + area(grid: &grid, r: r, c: c - 1)
        + area(grid: &grid, r: r, c: c + 1)
}
func inArea(grid: [[Int]], r: Int, c: Int) -> Bool {
    return r < grid.count && c < grid[0].count &&
            0 <= r && 0 <= c
}

