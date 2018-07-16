//
//  Queue.swift
//  algorithm
//
//  Created by Vu Tiet on 16/07/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

struct Queue<T>: CustomStringConvertible {
    fileprivate var data: [T] = []
    
    func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    func count() -> Int {
        return data.count
    }
    
    mutating func enqueue(_ element: T) {
        data.append(element)
    }
    
    mutating func dequeue() -> T? {
        if data.isEmpty == false, data.first != nil {
            return data.removeFirst()
        }
        return nil
    }
    
    func peek() -> T? {
        return data.first
    }
    
    var description: String {
        let topDivider = "Queue:--------------- \n"
        let bottomDivider = "\n----------------------"
        let stackContent = data.map({"\($0)"}).joined(separator: " --- ")
        return topDivider + stackContent + bottomDivider
    }
}
