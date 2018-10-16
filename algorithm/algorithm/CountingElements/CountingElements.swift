//
//  CountingElements.swift
//  algorithm
//
//  Created by Vu Tiet on 15/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class CountingElements {
    
//    PermCheck
//    Check whether array A is a permutation.
//    A non-empty array A consisting of N integers is given.
//
//    A permutation is a sequence containing each element from 1 to N once, and only once.
//
//    For example, array A such that:
//
//    A[0] = 4
//    A[1] = 1
//    A[2] = 3
//    A[3] = 2
//    is a permutation, but array A such that:
//
//    A[0] = 4
//    A[1] = 1
//    A[2] = 3
//    is not a permutation, because value 2 is missing.
//
//    The goal is to check whether array A is a permutation.
//
//    Write a function:
//
//    public func solution(_ A : inout [Int]) -> Int
//
//    that, given an array A, returns 1 if array A is a permutation and 0 if it is not.
//
//    For example, given array A such that:
//
//    A[0] = 4
//    A[1] = 1
//    A[2] = 3
//    A[3] = 2
//    the function should return 1.
//
//    Given array A such that:
//
//    A[0] = 4
//    A[1] = 1
//    A[2] = 3
//    the function should return 0.
//
//    Write an efficient algorithm for the following assumptions:
//
//    N is an integer within the range [1..100,000];
//    each element of array A is an integer within the range [1..1,000,000,000].
    
    class func premCheck(_ A: [Int]) -> Int {
        var checks = [Int:Int]()
        for value in A {
            checks[value] = value
        }
        
        for i in 1...A.count {
            if checks[i] == nil {
                return 0
            }
        }
        return 1
    }
    
    
//    FrogRiverOne
//    Find the earliest time when a frog can jump to the other side of a river.
//    A small frog wants to get to the other side of a river. The frog is initially located on one bank of the river (position 0) and wants to get to the opposite bank (position X+1). Leaves fall from a tree onto the surface of the river.
//
//    You are given an array A consisting of N integers representing the falling leaves. A[K] represents the position where one leaf falls at time K, measured in seconds.
//
//    The goal is to find the earliest time when the frog can jump to the other side of the river. The frog can cross only when leaves appear at every position across the river from 1 to X (that is, we want to find the earliest moment when all the positions from 1 to X are covered by leaves). You may assume that the speed of the current in the river is negligibly small, i.e. the leaves do not change their positions once they fall in the river.
//
//    For example, you are given integer X = 5 and array A such that:
//
//    A[0] = 1
//    A[1] = 3
//    A[2] = 1
//    A[3] = 4
//    A[4] = 2
//    A[5] = 3
//    A[6] = 5
//    A[7] = 4
//    In second 6, a leaf falls into position 5. This is the earliest time when leaves appear in every position across the river.
//
//    Write a function:
//
//    public func solution(_ X : Int, _ A : inout [Int]) -> Int
//
//    that, given a non-empty array A consisting of N integers and integer X, returns the earliest time when the frog can jump to the other side of the river.
//
//    If the frog is never able to jump to the other side of the river, the function should return −1.
//
//    For example, given X = 5 and array A such that:
//
//    A[0] = 1
//    A[1] = 3
//    A[2] = 1
//    A[3] = 4
//    A[4] = 2
//    A[5] = 3
//    A[6] = 5
//    A[7] = 4
//    the function should return 6, as explained above.
//
//    Write an efficient algorithm for the following assumptions:
//
//    N and X are integers within the range [1..100,000];
//    each element of array A is an integer within the range [1..X].

    class func frogRiverOne(_ X : Int, _ A : inout [Int]) -> Int {
        var checks = [Int:Int]()
        for i in 1...X {
            checks[i] = 0
        }
        
        var uncovered = X
        for j in 0...A.count-1 {
            if checks[A[j]] == 0 {
                checks[A[j]] = 1
                uncovered -= 1
            }
            if uncovered == 0 {
                return j
            }
        }
        return -1
    }
}
