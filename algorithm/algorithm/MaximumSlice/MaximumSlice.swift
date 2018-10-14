//
//  MaximumSlice.swift
//  algorithm
//
//  Created by Vu Tiet on 13/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class MaximumSlice {
    
//    1. MaxSliceSum
//    Find a maximum sum of a compact subsequence of array elements.
//
//    For example, given array A such that:
//    A[0] = 3  A[1] = 2  A[2] = -6
//    A[3] = 4  A[4] = 0
//    the function should return 5 because:
//
//    (3, 4) is a slice of A that has sum 4,
//    (2, 2) is a slice of A that has sum −6,
//    (0, 1) is a slice of A that has sum 5,
//    no other slice of A has sum greater than (0, 1).
    
    public class func maxSliceSum(_ A : inout [Int]) -> Int {
        var maxSum : Int = 0
        var maxAtEnding : Int = 0
        for i in 0...A.count-1 {
            if i == 0 {
                maxAtEnding = A[i]
                maxSum = maxAtEnding
            } else {
                maxAtEnding = max(maxAtEnding + A[i], A[i])
                maxSum = max(maxSum, maxAtEnding)
            }
        }
        return maxSum
    }
    
////////////////////////////////////////////////////////////////////////////////
//    1. Max Profit
//    An array A consisting of N integers is given. It contains daily prices of a stock share for a period of N consecutive days. If a single share was bought on day P and sold on day Q, where 0 ≤ P ≤ Q < N, then the profit of such transaction is equal to A[Q] − A[P], provided that A[Q] ≥ A[P]. Otherwise, the transaction brings loss of A[P] − A[Q].
//
//    For example, consider the following array A consisting of six elements such that:
//
//    A[0] = 23171
//    A[1] = 21011
//    A[2] = 21123
//    A[3] = 21366
//    A[4] = 21013
//    A[5] = 21367
//    If a share was bought on day 0 and sold on day 2, a loss of 2048 would occur because A[2] − A[0] = 21123 − 23171 = −2048. If a share was bought on day 4 and sold on day 5, a profit of 354 would occur because A[5] − A[4] = 21367 − 21013 = 354. Maximum possible profit was 356. It would occur if a share was bought on day 1 and sold on day 5.
//
//    Write a function,
//
//    public func solution(_ A : inout [Int]) -> Int
//
//    that, given an array A consisting of N integers containing daily prices of a stock share for a period of N consecutive days, returns the maximum possible profit from one transaction during this period. The function should return 0 if it was impossible to gain any profit.

    public func maxProfit(_ A : inout [Int]) -> Int {
        guard A.count > 1 else {
            return 0
        }
        
        var maxProfit = 0
        var maxAtIndex = 0
        var buyIndex = 0
        for i in 1...A.count-1 {
            maxAtIndex = max(A[i] - A[buyIndex], A[i] - A[i-1])
            if maxAtIndex < 0 {
                buyIndex = i
                maxAtIndex = 0
            }
            maxProfit = max(maxProfit, maxAtIndex)
        }
        
        return maxProfit
    }
    
    
}
