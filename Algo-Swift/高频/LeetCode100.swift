//
//  LeetCodeHot100.swift
//  Algo-Swift
//
//  Created by longhuadmin on 2020/11/26.
//  Copyright © 2020 KM. All rights reserved.
//

import Foundation

class LeetCodeSolution {
    /**
     509. 斐波那契数
    ------------------------------------
     方法：使用递归-效率慢，使用一次for循环即可避免重复计算问题提高效率到O(N)
     **/
    func fib(_ N: Int) -> Int {
        if N == 0 { return 0 }
        if N == 1 { return 1 }
        // 解决斐波那契使用循环的方法，从下向上一次计算2...N的数列，避免递归多次的重复计算
        var one = 0
        var two = 1
        var result = 0
        for _ in 2...N {
            result = one + two
            one = two
            two = result
        }
        return result
    }
    /**
     70. 爬楼梯
     假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
     每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
     ------------------------------------
     **/
    //1 循环：https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof/solution/javaqing-wa-tiao-tai-jie-he-fei-bo-na-qi-shu-lie-t/

    func climbStairsNormal(_ n: Int) -> Int {
        if n < 2 {
            return n
        }
        // 注意初始化值都是1
        var first = 1
        var second = 1
        var sum = 1
        for _ in 2...n {
            sum = first + second
            first = second
            second = sum
        }
        return sum
    }
    
    /*
     2 标签：动态规划
     链接：https://leetcode-cn.com/problems/climbing-stairs/solution/hua-jie-suan-fa-70-pa-lou-ti-by-guanpengchn/
     本问题其实常规解法可以分成多个子问题，爬第n阶楼梯的方法数量，等于 2 部分之和:

     - 爬上 n-1n−1 阶楼梯的方法数量。因为再爬1阶就能到第n阶
     - 爬上 n-2n−2 阶楼梯的方法数量，因为再爬2阶就能到第n阶
     - 所以我们得到公式 dp[n] = dp[n-1] + dp[n-2]
     - 时间复杂度：O(n)
     */
    func climbStairsByDynamic(_ n: Int) -> Int {
        // 1初始化用repeating数组大小: n+1
        var dp = [Int](repeating: 0, count: n + 1)
        // 2 初始化dp[0]、dp[1]
        dp[0] = 1
        dp[1] = 1
        // 3 dp[n] = dp[n-1] + dp[n-2]
        for i in 2...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        return dp[n]
    }
    /**
     剑指 Offer 10- II. 青蛙跳台阶问题
     一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。
     答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。
    ------------------------------------
     **/
    
    // pass递归法 时间超出限制
    
    /*
     方法1：自下而上循环求余法 注意-大数越界： 随着 nn 增大, f(n)f(n) 会超过 Int32 甚至 Int64 的取值范围，导致最终的返回值错误。
     时间复杂度O(N)
     */
    func fogByCycle(_ n: Int) -> Int {
        var a = 1
        var b = 1
        var sum = 1
        // 大数越界： 随着 nn 增大, f(n)f(n) 会超过 Int32 甚至 Int64 的取值范围，导致最终的返回值错误。
        for _ in 0..<n {
            sum = (a + b) % 1000000007
            a = b
            b = sum
        }
        return a
    }
    
    /*
     方法2：动态规划法: https://leetcode-cn.com/problems/qing-wa-tiao-tai-jie-wen-ti-lcof/solution/javaqing-wa-tiao-tai-jie-he-fei-bo-na-qi-shu-lie-t/
     / 三剑客：1 定义数组 保存路径数据
     // 三剑客：2 定义初始条件防止越界
     // 三剑客：3 dp函数关系式
     */
    func fogByDynamic(_ n: Int) -> Int {
        // 三剑客：1 定义数组 保存路径数据
        // 三剑客：2 定义初始条件防止越界
        // 三剑客：3 dp函数关系式
        if n <= 1 { return 1 }
        if n == 2 { return 2 }
        var dp = [Int](repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2]
            dp[i] %= 1000000007
        }
        return dp[n]
    }
}

