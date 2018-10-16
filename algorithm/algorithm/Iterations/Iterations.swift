//
//  Iterations.swift
//  algorithm
//
//  Created by Vu Tiet on 15/10/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class Iterations {
    
    class func binaryGapsCount(_ N: Int) -> Int {
        var maxLength = 0
        var lengthAtIndex = 0
        var halfN = N
        var shouldCount = false
        while halfN > 0 {
            if halfN % 2 == 1 {
                shouldCount = true
                maxLength = max(maxLength, lengthAtIndex)
                lengthAtIndex = 0
            } else if shouldCount {
                lengthAtIndex += 1
            }
            halfN /= 2
        }
        return maxLength
    }
    
}
