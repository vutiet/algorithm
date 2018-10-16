//
//  Caterpillar.swift
//  algorithm
//
//  Created by Vu Tiet on 14/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class Caterpillar {
    
//    Let’s check whether a sequence a0, a1,...,an≠1 (1 ˛ ai ˛ 109) contains a contiguous subsequence
//    whose sum of elements equals s. For example, in the following sequence we are looking
//    for a subsequence whose total equals s = 12.
//    a0 a1 a2 a3 a4 a5 a6
//    6 2 7 4 1 3 6
//    Each position of the caterpillar will represent a dierent
//    contiguous subsequence in which
//    the total of the elements is not greater than s. Let’s initially set the caterpillar on the first
//    element. Next we will perform the following steps:
//    • if we can, we move the right end (front) forward and increase the size of the caterpillar;
//    • otherwise, we move the left end (back) forward and decrease the size of the caterpillar.
//    In this way, for every position of the left end we know the longest caterpillar that covers
//    elements whose total is not greater than s. If there is a subsequence whose total of elements
//    equals s, then there certainly is a moment when the caterpillar covers all its elements
    
    class func checkExistenceOfSequence(in array: [Int], sum: Int) -> Bool {
        var front = 0
        var total = 0
        for back in 0..<array.count {
            while front < array.count, total + array[front] <= sum {
                total += array[front]
                front += 1
            }
            if total == sum {
                return true
            }
            
            // here total > sum, we need to remove array[back] out of total
            // because back will move forward
            total -= array[back]
        }
        return false
    }
    
    
//    Problem: You are given n sticks (of lengths 1 ˛ a0 ˛ a1 ˛ ... ˛ an≠1 ˛ 109). The goal is
//    to count the number of triangles that can be constructed using these sticks. More precisely,
//    we have to count the number of triplets at indices x<y<z, such that ax + ay > az.
//    Solution O(n2): For every pair x, y we can find the largest stick z that can be used to
//    construct the triangle. Every stick k, such that y<k ˛ z, can also be used, because the
//    condition ax + ay > ak will still be true. We can add up all these triangles at once.
//    If the value z is found every time from the beginning then we get a O(n3) time complexity
//    solution. However, we can instead use the caterpillar method. When increasing the value of
//    y, we can increase (as far as possible) the value of z.
    class func countTriangles(_ array: [Int]) -> Int {
        guard array.count > 2 else {
            return 0
        }
        var count = 0
        for x in 0..<array.count-2 {
            var z = x + 2
            for y in x+1..<array.count-1 {
                while z < array.count, array[x] + array[y] > array[z] {
                    // we keep moving forward to find the largest z
                    // that can make triangle, which is array[x] + array[y] > array[z]
                    z += 1
                }
                count += z - y - 1 // here we find largest z, need to cound number of triangles in between
            }
        }
        return count
    }
    
    
//    CountDistinctSlices
//    An integer M and a non-empty array A consisting of N non-negative integers are given. All integers in array A are less than or equal to M.
//
//    A pair of integers (P, Q), such that 0 ≤ P ≤ Q < N, is called a slice of array A. The slice consists of the elements A[P], A[P + 1], ..., A[Q]. A distinct slice is a slice consisting of only unique numbers. That is, no individual number occurs more than once in the slice.
//
//    For example, consider integer M = 6 and array A such that:
//
//    A[0] = 3
//    A[1] = 4
//    A[2] = 5
//    A[3] = 5
//    A[4] = 2
//    There are exactly nine distinct slices: (0, 0), (0, 1), (0, 2), (1, 1), (1, 2), (2, 2), (3, 3), (3, 4) and (4, 4).
//
//    The goal is to calculate the number of distinct slices.
//
//    Write a function:
//
//    public func solution(_ M : Int, _ A : inout [Int]) -> Int
//
//    that, given an integer M and a non-empty array A consisting of N integers, returns the number of distinct slices.
//
//    If the number of distinct slices is greater than 1,000,000,000, the function should return 1,000,000,000.
    class func countDistinctSlices(_ M: Int, _ A: [Int]) -> Int {
        
        guard A.count > 1 else {
            return 1
        }
        
        var count = 0
        var front = 0
        var seen = Array.init(repeating: false, count: M+1)
        for back in 0..<A.count {
            front = back
            while front < A.count, seen[A[front]] == false {
                count += 1
                seen[A[front]] = true
                front += 1
            }
            
            seen = seen.map({_ in false})
            
        }
        return min(count, 1000000000)
    }
    
//    AbsDistinct
//    A non-empty array A consisting of N numbers is given. The array is sorted in non-decreasing order. The absolute distinct count of this array is the number of distinct absolute values among the elements of the array.
//
//    For example, consider array A such that:
//
//    A[0] = -5
//    A[1] = -3
//    A[2] = -1
//    A[3] =  0
//    A[4] =  3
//    A[5] =  6
//    The absolute distinct count of this array is 5, because there are 5 distinct absolute values among the elements of this array, namely 0, 1, 3, 5 and 6.
//
//    Write a function:
//
//    public func solution(_ A : inout [Int]) -> Int
//
//    that, given a non-empty array A consisting of N numbers, returns absolute distinct count of array A.
    class func absDistinctCount(_ A: [Int]) -> Int {
        var dict = [Int: Int]()
        for i in 0..<A.count {
            let absValue = abs(A[i])
            dict[absValue] = absValue
        }
        return dict.keys.count
    }
    
}
