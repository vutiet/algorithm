//
//  Leader.swift
//  algorithm
//
//  Created by Vu Tiet on 17/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

// Let us consider a sequence a0, a1,...,an≠1. The leader of this sequence is the element whose
// value occurs more than n/2 times.
// Notice that the sequence can have at most one
// leader. If there were two leaders then their total occurrences would be more than 2 x n / 2 = n,
// but we only have n elements.

class Leader {
    
    // this method will return leader count and leader value
    class func findLeader(_ A: [Int]) -> (Int, Int) {
        var stack = [Int]()
        
        for value in A {
            if stack.count == 0 {
                stack.append(value)
            } else {
                if stack.last != value {
                    stack.removeLast()
                } else {
                    stack.append(value)
                }
            }
        }
        
        if let candidate = stack.last {
            var count = 0
            for value in A {
                if value == candidate {
                    count += 1
                }
            }
            if count > A.count / 2 {
                return (count, candidate)
            }
        }
        
        return (0, -1)
    }
    
//    EquiLeader
//    Find the index S such that the leaders of the sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N - 1] are the same.
//    A non-empty array A consisting of N integers is given.
//
//    The leader of this array is the value that occurs in more than half of the elements of A.
//
//    An equi leader is an index S such that 0 ≤ S < N − 1 and two sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N − 1] have leaders of the same value.
//
//    For example, given array A such that:
//
//    A[0] = 4
//    A[1] = 3
//    A[2] = 4
//    A[3] = 4
//    A[4] = 4
//    A[5] = 2
//    we can find two equi leaders:
//
//    0, because sequences: (4) and (3, 4, 4, 4, 2) have the same leader, whose value is 4.
//    2, because sequences: (4, 3, 4) and (4, 4, 2) have the same leader, whose value is 4.
//    The goal is to count the number of equi leaders.
//
//    Write a function:
//
//    public func solution(_ A : inout [Int]) -> Int
//
//    that, given a non-empty array A consisting of N integers, returns the number of equi leaders.
//
//    For example, given:
//
//    A[0] = 4
//    A[1] = 3
//    A[2] = 4
//    A[3] = 4
//    A[4] = 4
//    A[5] = 2
//    the function should return 2, as explained above.
//
//    Write an efficient algorithm for the following assumptions:
//
//    N is an integer within the range [1..100,000];
//    each element of array A is an integer within the range [−1,000,000,000..1,000,000,000].
    class func findEquiLeaders(_ A : inout [Int]) -> Int {
        if A.count == 1 {
            return 0
        }
        var equiLeader = 0
        let (leaderCount, leader) = findLeader(A)
        if leaderCount > 0 {
            var leaderCountAtIndex = 0
            for i in 0...A.count-1 {
                if A[i] == leader {
                    leaderCountAtIndex += 1
                }
                
                if leaderCountAtIndex > (i + 1) / 2 && (leaderCount - leaderCountAtIndex) > (A.count - 1 - i) / 2 {
                    equiLeader += 1
                }
            }
        }
        
        return equiLeader
    }
    
//    Dominator
//    Find an index of an array such that its value occurs at more than half of indices in the array.
//    An array A consisting of N integers is given. The dominator of array A is the value that occurs in more than half of the elements of A.
//    
//    For example, consider array A such that
//    
//    A[0] = 3    A[1] = 4    A[2] =  3
//    A[3] = 2    A[4] = 3    A[5] = -1
//    A[6] = 3    A[7] = 3
//    The dominator of A is 3 because it occurs in 5 out of 8 elements of A (namely in those with indices 0, 2, 4, 6 and 7) and 5 is more than a half of 8.
//    
//    Write a function
//    
//    public func solution(_ A : inout [Int]) -> Int
//    
//    that, given an array A consisting of N integers, returns index of any element of array A in which the dominator of A occurs. The function should return −1 if array A does not have a dominator.
//    
//    For example, given array A such that
//    
//    A[0] = 3    A[1] = 4    A[2] =  3
//    A[3] = 2    A[4] = 3    A[5] = -1
//    A[6] = 3    A[7] = 3
//    the function may return 0, 2, 4, 6 or 7, as explained above.
//    
//    Write an efficient algorithm for the following assumptions:
//    
//    N is an integer within the range [0..100,000];
//    each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
    class func findLeaderIndex(_ A: [Int]) -> Int {
        var stack = [Int]()
        
        for value in A {
            if stack.count == 0 {
                stack.append(value)
            } else {
                if stack.last != value {
                    stack.removeLast()
                } else {
                    stack.append(value)
                }
            }
        }
        
        if let candidate = stack.last {
            var count = 0
            var candidateIndex = -1
            for i in 0...A.count-1 {
                if A[i] == candidate {
                    candidateIndex = i
                    count += 1
                }
            }
            if count > A.count / 2 {
                return candidateIndex
            }
        }
        
        return -1
    }
}
