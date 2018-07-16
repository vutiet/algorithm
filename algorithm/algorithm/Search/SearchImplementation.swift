//
//  SearchImplementation.swift
//  duthutrendoi
//
//  Created by Vu Tiet on 11/07/2018.
//  Copyright © 2018 Vu Tiet. All rights reserved.
//

import UIKit

class SearchImplementation: NSObject {

    func binarySearch(array: [Int], left: Int, right: Int, value: Int) -> Int {
        if left > right {
            return -1
        }
        
        let midIndex = (left + right) / 2
        if array[midIndex] == value {
            return midIndex
        } else {
            var newLeft = left
            var newRight = right
            if value < array[midIndex] {
                newRight = midIndex - 1
            } else {
                newLeft = midIndex + 1
            }
            return binarySearch(array: array, left: newLeft, right: newRight, value: value)
        }
    }
}
