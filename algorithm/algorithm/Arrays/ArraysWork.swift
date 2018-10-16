//
//  ArraysWork.swift
//  algorithm
//
//  Created by Vu Tiet on 15/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class ArraysWork {

//    CyclicRotation
//    An array A consisting of N integers is given. Rotation of the array means that each element is shifted right by one index, and the last element of the array is moved to the first place. For example, the rotation of array A = [3, 8, 9, 7, 6] is [6, 3, 8, 9, 7] (elements are shifted right by one index and 6 is moved to the first place).
//
//    The goal is to rotate array A K times; that is, each element of A will be shifted to the right K times.
//
//    Write a function:
//
//    public func solution(_ A : inout [Int], _ K : Int) -> [Int]
//
//    that, given an array A consisting of N integers and an integer K, returns the array A rotated K times.
//
//    For example, given
//
//    A = [3, 8, 9, 7, 6]
//    K = 3
//    the function should return [9, 7, 6, 3, 8]. Three rotations were made:
//
//    [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
//    [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
//    [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
//    For another example, given
//
//    A = [0, 0, 0]
//    K = 1
//    the function should return [0, 0, 0]
//
//    Given
//
//    A = [1, 2, 3, 4]
//    K = 4
//    the function should return [1, 2, 3, 4]
//
//    Assume that:
//
//    N and K are integers within the range [0..100];
//    each element of array A is an integer within the range [−1,000..1,000].
    
    class func rotationArray(_ A: inout [Int], _ K: Int) -> [Int] {
        guard A.count > 0, K > 0 else {
            return A
        }
        
        var rotationTimes = K % A.count
        var result = A
        
        while rotationTimes > 0 {
            for i in 1..<result.count {
                result[i] = A[i-1]
            }
            result[0] = A[result.count-1]
            rotationTimes -= 1
            A = result
        }
        return result
    }
    
    
    
//    OddOccurrencesInArray
//    Task description
//    A non-empty array A consisting of N integers is given. The array contains an odd number of elements, and each element of the array can be paired with another element that has the same value, except for one element that is left unpaired.
//
//    For example, in array A such that:
//
//    A[0] = 9  A[1] = 3  A[2] = 9
//    A[3] = 3  A[4] = 9  A[5] = 7
//    A[6] = 9
//    the elements at indexes 0 and 2 have value 9,
//    the elements at indexes 1 and 3 have value 3,
//    the elements at indexes 4 and 6 have value 9,
//    the element at index 5 has value 7 and is unpaired.
//    Write a function:
//
//    public func solution(_ A : inout [Int]) -> Int
//
//    that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.
//
//    For example, given array A such that:
//
//    A[0] = 9  A[1] = 3  A[2] = 9
//    A[3] = 3  A[4] = 9  A[5] = 7
//    A[6] = 9
//    the function should return 7, as explained in the example above.
    class func checkOddOccurrencesInArray(_ A : inout [Int]) -> Int {
        var result = A[0]
        for i in 1..<A.count {
            result ^= A[i]
        }
        return result
    }
}
