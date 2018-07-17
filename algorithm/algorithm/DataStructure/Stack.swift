//
//  Stack.swift
//  duthutrendoi
//
//  Created by Vu Tiet on 16/07/2018.
//  Copyright © 2018 Vu Tiet. All rights reserved.
//

import Foundation

struct Stack<T>: CustomStringConvertible {

    fileprivate var data: [T] = []
    
    mutating func push(_ element: T) {
        data.append(element)
    }
    
    @discardableResult mutating func pop() -> T {
        return data.removeLast()
    }
    
    func peek() -> T? {
        return data.last
    }
    
    func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    func count() -> Int {
        return data.count
    }
    
    var description: String {
        let topDivider = "Stack: ------------ \n"
        let bottomDivider = "\n----------------------"
        let stackContent = data.map({"\($0)"}).reversed().joined(separator: " --- ")
        return topDivider + stackContent + bottomDivider
    }
    
}
