//
//  FibonacciNumber.swift
//  algorithm
//
//  Created by Vu Tiet on 14/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class FibonacciNumber {
    
    class func fibonacciValue(at index: Int) -> Int {
        guard index > 0 else {
            return 0
        }
        
        var fib = [0] // f(0) will be 0
        fib.append(1) // f(1) will be 1
        for _ in 2...index {
            let iFib = fib[0] + fib[1]
            fib[0] = fib[1]
            fib[1] = iFib
            
        }
        return fib.last!
    }
    
    class func fibonacciNumbers(_ n: Int) -> [Int] {
        guard n > 0 else {
            return [Int]()
        }
        
        var fib = [Int]()
        fib.append(0) // f(0) = 0
        fib.append(1) // f(1) = 1
        
        if n == 1 {
            return [0]
        }
        
        if n == 2 {
            return fib
        }
        
        for i in 2...n {
            fib.append(fib[i-2] + fib[i-1])
        }
        return fib
    }
}

