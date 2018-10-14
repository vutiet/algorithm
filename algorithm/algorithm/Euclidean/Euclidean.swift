//
//  Euclidean.swift
//  algorithm
//
//  Created by Vu Tiet on 14/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class Euclidean {
    
    class func greatestCommonDivisor(_ a: Int,_ b: Int) -> Int {
        if a % b == 0 {
            return b
        }
        return greatestCommonDivisor(b, a % b)
    }
    
    class func optimizeGCD(_ a: Int, _ b: Int, rest: Int) -> Int {
        if a == b {
            return rest * a
        }
        
        if a % 2 == 0 && b % 2 == 0 {
            return optimizeGCD(a / 2, b / 2, rest: rest * 2)
        }
        
        if a % 2 == 0 {
            return optimizeGCD(a / 2, b, rest: rest)
        }
        
        if b % 2 == 0 {
            return optimizeGCD(a, b / 2, rest: rest)
        }
        
        if a > b {
            return optimizeGCD(a - b, b, rest: rest)
        }
        
        return optimizeGCD(a, b - a, rest: rest)
    }
    
    
    // leastCommonMultiple (lcm) of a and b is
    // lcm = a * b / gcd(a, b)
    class func leastCommonMultiple(_ a: Int, _ b: Int) -> Int {
        return a * b / optimizeGCD(a, b, rest: 1)
    }
    
    
//    ChocolatesByNumbers
//    There are N chocolates in a circle. Count the number of chocolates you will eat.
//
//    Two positive integers N and M are given. Integer N represents the number of chocolates arranged in a circle, numbered from 0 to N − 1.
//
//    You start to eat the chocolates. After eating a chocolate you leave only a wrapper.
//
//    You begin with eating chocolate number 0. Then you omit the next M − 1 chocolates or wrappers on the circle, and eat the following one.
//
//    More precisely, if you ate chocolate number X, then you will next eat the chocolate with number (X + M) modulo N (remainder of division).
//
//    You stop eating when you encounter an empty wrapper.
//
//    For example, given integers N = 10 and M = 4. You will eat the following chocolates: 0, 4, 8, 2, 6.
//
//    The goal is to count the number of chocolates that you will eat, following the above rules.
//
//    Write a function:
//
//    public func solution(_ N : Int, _ M : Int) -> Int
//
//    that, given two positive integers N and M, returns the number of chocolates that you will eat.
//
//    For example, given integers N = 10 and M = 4. the function should return 5, as explained above.
//
//    Write an efficient algorithm for the following assumptions:
//
//    N and M are integers within the range [1..1,000,000,000].
    class func eatChocolatesInCircle(_ N : Int, _ M : Int) -> Int {
        let gcd = optimizeGCD(N, M, rest: 1)
        return N / gcd
    }

}
