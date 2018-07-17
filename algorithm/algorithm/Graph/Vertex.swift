//
//  Vertex.swift
//  algorithm
//
//  Created by Vu Tiet on 17/07/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    var hashValue: Int {
        return "\(data)".hashValue
    }
    
    static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    var description: String {
        return "\(data)"
    }
}
