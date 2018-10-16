//
//  Greedy.swift
//  algorithm
//
//  Created by Vu Tiet on 14/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class Greedy {
    
//    TieRopes
//    There are N ropes numbered from 0 to N − 1, whose lengths are given in an array A, lying on the floor in a line. For each I (0 ≤ I < N), the length of rope I on the line is A[I].
//    
//    We say that two ropes I and I + 1 are adjacent. Two adjacent ropes can be tied together with a knot, and the length of the tied rope is the sum of lengths of both ropes. The resulting new rope can then be tied again.
//    
//    For a given integer K, the goal is to tie the ropes in such a way that the number of ropes whose length is greater than or equal to K is maximal.
//    
//    For example, consider K = 4 and array A such that:
//    
//    A[0] = 1
//    A[1] = 2
//    A[2] = 3
//    A[3] = 4
//    A[4] = 1
//    A[5] = 1
//    A[6] = 3
//    
//    We can tie:
//    
//    rope 1 with rope 2 to produce a rope of length A[1] + A[2] = 5;
//    rope 4 with rope 5 with rope 6 to produce a rope of length A[4] + A[5] + A[6] = 5.
//    After that, there will be three ropes whose lengths are greater than or equal to K = 4. It is not possible to produce four such ropes.
    
    class func tieRopes(_ K : Int, _ A : inout [Int]) -> Int {
        var count = 0
        var length = 0
        for rope in A {
            length += rope
            if length >= K {
                count += 1
                length = 0
            }
        }
        return count
    }
}
