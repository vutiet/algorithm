//
//  Graphable.swift
//  algorithm
//
//  Created by Vu Tiet on 17/07/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible { get }
    
    func createVertex(data: Element) -> Vertex<Element>
    func add(from source: Vertex<Element>, to destination: Vertex<Element>, edgeType: EdgeType, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) -> [Edge<Element>]?
    
    func breadthFirstSearchTraverse(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Vertex<Element>]
    func breadthFirstSearchShortest(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Vertex<Element>]
    
    func depthFirstSearchTraverse(from vertex: Vertex<Element>) -> [Vertex<Element>]
    func depthFirstSearchPaths(from vertex: Vertex<Element>, to destination: Vertex<Element>) -> [Vertex<Element>]
}
