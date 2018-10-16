//
//  TimeComplexity.swift
//  algorithm
//
//  Created by Vu Tiet on 15/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class TimeComplexity {
//    PermMissingElem
//    Find the missing element in a given permutation.
//    An array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.
//    Your goal is to find that missing element.
//    Write a function:
//    public func solution(_ A : inout [Int]) -> Int
//
//    that, given an array A, returns the value of the missing element.
//    For example, given array A such that:
//
//    A[0] = 2
//    A[1] = 3
//    A[2] = 1
//    A[3] = 5
//    the function should return 4, as it is the missing element.
//
//    Write an efficient algorithm for the following assumptions:
//
//    N is an integer within the range [0..100,000];
//    the elements of A are all distinct;
//    each element of array A is an integer within the range [1..(N + 1)].
    
    class func permMissingElement(_ A: [Int]) -> Int {
        // total of 1 to A.count + 1
        let fullTotal = ((A.count + 1) * (A.count + 2)) / 2
        
        // total of A
        var total = 0
        for value in A {
            total += value
        }
        
        let missingValue = fullTotal - total
        return missingValue
    }
    
    
//    FrogJmp
//    Count minimal number of jumps from position X to Y.
//    Task description
//    A small frog wants to get to the other side of the road. The frog is currently located at position X and wants to get to a position greater than or equal to Y. The small frog always jumps a fixed distance, D.
//
//    Count the minimal number of jumps that the small frog must perform to reach its target.
//
//    Write a function:
//
//    public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int
//
//    that, given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.
//
//    For example, given:
//
//    X = 10
//    Y = 85
//    D = 30
//    the function should return 3, because the frog will be positioned as follows:
//
//    after the first jump, at position 10 + 30 = 40
//    after the second jump, at position 10 + 30 + 30 = 70
//    after the third jump, at position 10 + 30 + 30 + 30 = 100
//    Write an efficient algorithm for the following assumptions:
//
//    X, Y and D are integers within the range [1..1,000,000,000];
//    X ≤ Y.
    class func countFrogJump(_ X : Int, _ Y : Int, _ D : Int) -> Int {
        let distance = Y - X
        var steps = distance / D
        if distance % D > 0 {
            steps += 1
        }
        return steps
    }

    
    class func tapeEquilibrium(_ A : inout [Int]) -> Int {
        guard A.count > 2 else {
            return abs(A[0] - A[1])
        }
        
        var sumRight = 0
        for value in A {
            sumRight += value
        }
        
        var sumLeft = A[0]
        sumRight -= A[0]
        var minValue = abs(sumLeft - sumRight)
        for i in 2...A.count-1 {
            sumLeft += A[i-1]
            sumRight -= A[i-1]
            minValue = min(minValue, abs(sumLeft - sumRight))
        }
        return minValue
    }
}
