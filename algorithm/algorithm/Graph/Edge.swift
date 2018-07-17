//
//  Edge.swift
//  algorithm
//
//  Created by Vu Tiet on 17/07/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

enum EdgeType {
    case directed
    case undirected
}

struct Edge<T: Hashable> {
    var source: Vertex<T>
    var destination: Vertex<T>
    var weight: Double?
}

extension Edge: Hashable {
    var hashValue: Int {
        return "\(source)\(destination)\(weight ?? 0)".hashValue
    }
    
    static func ==(lhs: Edge, rhs: Edge) -> Bool {
        return lhs.source == rhs.source
            && lhs.destination == rhs.destination
            && lhs.weight == rhs.weight
    }
}

extension Edge: CustomStringConvertible {
    var description: String {
        return "from: \(source) --> to: \(destination); weight: \(weight ?? 0)"
    }
}



