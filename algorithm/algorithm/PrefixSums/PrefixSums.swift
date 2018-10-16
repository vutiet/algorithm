//
//  PrefixSums.swift
//  algorithm
//
//  Created by Vu Tiet on 16/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class PrefixSums {
    
    // prefixSums[0] = 0
    // prefixSums[1] = A[0]
    // prefixSums[2] = A[0] + A[1]
    // prefixSums[3] = A[0] + A[1] + A[2]
    // prefixSums[n] = A[0] + A[1] + A[2] + ... + A[n-1]
    class func prefixSum(_ A:[Int]) -> [Int] {
        var prefixSums = [0]
        for i in 1...A.count {
            prefixSums.append(prefixSums[i-1] + A[i-1])
        }
        return prefixSums
    }
    
    // we count sum from startIndex to endIndex
    // the sum will include value at startIndex and endIndex
    // for example
    //    2 3 7 5 1 3 9 // value
    //    0 1 2 3 4 5 6 // index
    // startIndex = 2
    // endIndex = 6
    // total = 25
    class func countTotalOfPrefixSums(prefixSum: [Int], startIndex: Int, endIndex: Int) -> Int {
        let totalAtEndIndex = prefixSum[endIndex + 1]
        let totalBeforeAtIndex = prefixSum[startIndex]
        let total = totalAtEndIndex - totalBeforeAtIndex
        return total
    }
    
//    Problem: You are given a non-empty, zero-indexed array A of n (1 ¬ n ¬ 100 000) integers
//    a0, a1, . . . , an−1 (0 ¬ ai ¬ 1 000). This array represents number of mushrooms growing on the
//    consecutive spots along a road. You are also given integers k and m (0 ¬ k, m < n).
//    A mushroom picker is at spot number k on the road and should perform m moves. In
//    one move she moves to an adjacent spot. She collects all the mushrooms growing on spots
//    she visits. The goal is to calculate the maximum number of mushrooms that the mushroom
//    picker can collect in m moves.
//    For example, consider array A such that:
//    2 3 7 5 1 3 9 // value
//    0 1 2 3 4 5 6 // index
//    The mushroom picker starts at spot k = 4 and should perform m = 6 moves. She might
//    move to spots 3, 2, 3, 4, 5, 6 and thereby collect 1 + 5 + 7 + 3 + 9 = 25 mushrooms. This is the
//    maximal number of mushrooms she can collect.
//
//    Solution O(m2):
//    Note that the best strategy is to move in one direction optionally followed
//    by some moves in the opposite direction. In other words, the mushroom picker should not
//    change direction more than once. With this observation we can find the simplest solution.
//    Make the first p = 0, 1, 2, . . . , m moves in one direction, then the next m − p moves in the
//    opposite direction. This is just a simple simulation of the moves of the mushroom picker
//    which requires O(m2) time.
//
//    Solution O(n+m): A better approach is to use prefix sums. If we make p moves in one direction,
//    we can calculate the maximal opposite location of the mushroom picker. The mushroom
//    picker collects all mushrooms between these extremes. We can calculate the total number of
//    collected mushrooms in constant time by using prefix sums.
    
    class func pickMushrooms(_ A: [Int], k: Int, m: Int) -> Int {
        let n = A.count
        var result = 0
        let pref = prefixSum(A)
        
        // the starting point to go left
        // it must be the smallest value of
        // m: number of moves
        // k: the total moves of array
        let leftStart = min(m, k)
        for i in 0...leftStart {
            let leftPos = k - i // go to left, 1 by 1
            
            // find the furthest right pos
            let numStepToBack = 2 * i // to go back to the first pos (i.e. k) after go i steps, we need 2 * i
            let remainingnumStepToM = m - numStepToBack // number of steps to fill m moves, after go i steps to left then go back i steps to k
            let possibleFurthestPos = max(k, k + remainingnumStepToM) // need to compare with k, in case 2 * i > m, that means we go way too far to left and can't go back to k
            let rightPos = min(n - 1, possibleFurthestPos) // if possibleFurthestPos is too far on right, we can only get the end index of array
    
            // we find new result by get maximum value of:
            // current result
            // the sum from leftPos to rightPos
            result = max(result, countTotalOfPrefixSums(prefixSum: pref, startIndex: leftPos, endIndex: rightPos))
        }
        
        // the stating point to go to right
        // it must be the smallest value of
        // m + 1 : m moves from k
        // n - k : the moves left on the right from k
        let rightStart = min(m+1, n-k)
        for j in 0..<rightStart {
            let rightPos = k + j // go to right, 1 by 1
            
            let numStepToBack = 2 * j // to go back to the first pos: k
            let remainingnumStepToM = m - numStepToBack // number of steps to fill m moves, after go i steps to right then go back i steps to k
            let possibleFurthestPos = min(k, k - remainingnumStepToM) // need to get min with k, in case 2 * i > m, that means we go way too far to right and can't go back to k
            let leftPos = max(0, possibleFurthestPos) // if possibleFurthestPos is too far on left, which is negative value, we stop at first index, which is 0
            
            // we find new result by get maximum value of:
            // current result
            // the sum from leftPos to rightPos
            result = max(result, countTotalOfPrefixSums(prefixSum: pref, startIndex: leftPos, endIndex: rightPos))
        }
        return result
    }
    
    
    
//    PassingCars
//    Count the number of passing cars on the road.
//
//    A non-empty array A consisting of N integers is given. The consecutive elements of array A represent consecutive cars on a road.
//
//    Array A contains only 0s and/or 1s:
//
//    0 represents a car traveling east,
//    1 represents a car traveling west.
//    The goal is to count passing cars. We say that a pair of cars (P, Q), where 0 ≤ P < Q < N, is passing when P is traveling to the east and Q is traveling to the west.
//
//    For example, consider array A such that:
//
//    A[0] = 0
//    A[1] = 1
//    A[2] = 0
//    A[3] = 1
//    A[4] = 1
//    We have five pairs of passing cars: (0, 1), (0, 3), (0, 4), (2, 3), (2, 4).
//
//    Write a function:
//
//    public func solution(_ A : inout [Int]) -> Int
//
//    that, given a non-empty array A of N integers, returns the number of pairs of passing cars.
//
//    The function should return −1 if the number of pairs of passing cars exceeds 1,000,000,000.
//
//    For example, given:
//
//    A[0] = 0
//    A[1] = 1
//    A[2] = 0
//    A[3] = 1
//    A[4] = 1
//    the function should return 5, as explained above.
//
//    Write an efficient algorithm for the following assumptions:
//
//    N is an integer within the range [1..100,000];
//    each element of array A is an integer that can have one of the following values: 0, 1.

    class func countPassingCars(_ A: [Int]) -> Int {
        guard A.count > 1 else {
            return 0
        }
    
        let sums = prefixSum(A)
        
        var count = 0
        for i in 0...A.count-1 {
            if A[i] == 0 {
                count += sums[A.count] - sums[i]
            }
        }
        return count <= 1000000000 ? count : -1
    }
    
}
