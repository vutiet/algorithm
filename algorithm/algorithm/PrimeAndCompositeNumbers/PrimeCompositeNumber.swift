//
//  PrimeCompositeNumber.swift
//  algorithm
//
//  Created by Vu Tiet on 14/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class PrimeCompositeNumber {
    
//    Problem: Consider n coins aligned in a row. Each coin is showing heads at the beginning, display at 0
//    1 1 1 1 1 1 1 1 1 1
//    Then, n people turn over corresponding coins as follows. Person i reverses coins with numbers
//    that are multiples of i. That is, person i flips coins i, 2 · i, 3 · i, . . . until no more appropriate
//    coins remain. The goal is to count the number of coins showing tails, display as 0. In the above example,
//    the final configuration is:
//    0 1 1 0 1 1 1 1 0 1
    
    class func reverseCoins(_ coins: inout [Int]) -> [Int] {
        var i = 1
        while i * i <= coins.count-1 {
            coins[i*i-1] = 0
            i += 1
        }
        return coins
    }
    
////////////////////////////////////////////////////////////
//    Count Factor
//    A positive integer D is a factor of a positive integer N if there exists an integer M such that N = D * M.
//
//    For example, 6 is a factor of 24, because M = 4 satisfies the above condition (24 = 6 * 4).
//
//    Write a function:
//
//    int solution(int N);
//
//    that, given a positive integer N, returns the number of its factors.
//
//    For example, given N = 24, the function should return 8, because 24 has 8 factors, namely 1, 2, 3, 4, 6, 8, 12, 24. There are no other factors of 24.
//
//    Write an efficient algorithm for the following assumptions:
//
//    N is an integer within the range [1..2,147,483,647].

    class func countFactor(_ N : Int) -> Int {
        guard N > 1 else {
            return 1
        }
        var count = 1 // it's N
        let halfN = N / 2
        var i = 1
        while i <= halfN {
            if (N % i == 0) {
                count += 1
            }
            i += 1
        }
        return count
    }
    
    
//////////////////////////////////////////////////////////
//    MinPerimeterRectangle
//
//    An integer N is given, representing the area of some rectangle.
//
//    The area of a rectangle whose sides are of length A and B is A * B, and the perimeter is 2 * (A + B).
//
//    The goal is to find the minimal perimeter of any rectangle whose area equals N. The sides of this rectangle should be only integers.
//
//    For example, given integer N = 30, rectangles of area 30 are:
//
//    (1, 30), with a perimeter of 62,
//    (2, 15), with a perimeter of 34,
//    (3, 10), with a perimeter of 26,
//    (5, 6), with a perimeter of 22.
//    Write a function:
//
//    public func solution(_ N : Int) -> Int
//
//    that, given an integer N, returns the minimal perimeter of any rectangle whose area is exactly equal to N.
//
//    For example, given an integer N = 30, the function should return 22, as explained above.
//
//    Write an efficient algorithm for the following assumptions:
//
//    N is an integer within the range [1..1,000,000,000].

    public func minPerimeterRectangle(_ N : Int) -> Int {
        guard N > 1 else {
            return 4
        }
        
        if isPrimeNumber(N) {
            return 2 * (1 + N)
        }
        
        var minLength = 1 + N
        for i in 1...N/2 {
            if i * i == N {
                return 2 * (i + i)
            }
            if N % i == 0 {
                minLength = min(minLength, (i + N/i))
            }
        }
        return 2 * minLength
        
    }
    
    func isPrimeNumber(_ number: Int) -> Bool {
        guard number > 1 else {
            return false
        }
        
        var i = 2
        while i * i <= number {
            if number % i == 0 {
                return false
            }
            i += 1
        }
        return true
    }
    
    
    
    
}
