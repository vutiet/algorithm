//
//  Sieve.swift
//  algorithm
//
//  Created by Vu Tiet on 14/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation


class SieveOfEratosthenes {
    class func sievePrimeNumber(_ number: Int) -> [Int] {
        guard number >= 2 else {
            return [Int]()
        }
        
        var sieve = Array.init(repeating: 1, count: number+1)
        
        var i = 2
        while i * i <= number {
            if sieve[i] == 1 {
                var k = i * i
                while k <= number {
                    sieve[k] = 0
                    k += i
                }
            }
            i += 1
        }
        
        var result = [Int]()
        for i in 2...number {
            if sieve[i] == 1 {
                result.append(i)
            }
        }
    
        return result
    }
}
