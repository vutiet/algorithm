//
//  AdjacencyList.swift
//  algorithm
//
//  Created by Vu Tiet on 17/07/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class AdjacencyList<T: Hashable> {
    var list: [Vertex<T> : [Edge<T>]] = [:]
    init() {}
    
    private func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        list[source]?.append(edge)
    }
}

extension AdjacencyList: Graphable {
   
    typealias Element = T
    func createVertex(data: AdjacencyList.Element) -> Vertex<AdjacencyList.Element> {
        let vertex = Vertex(data: data)
        if list[vertex] == nil {
            list[vertex] = []
        }
        return vertex
    }
    
    func add(from source: Vertex<AdjacencyList.Element>, to destination: Vertex<AdjacencyList.Element>, edgeType: EdgeType, weight: Double?) {
        switch edgeType {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addDirectedEdge(from: source, to: destination, weight: weight)
            addDirectedEdge(from: destination, to: source, weight: weight)
        }
        
    }
    
    func edges(from source: Vertex<AdjacencyList.Element>) -> [Edge<AdjacencyList.Element>]? {
        return list[source]
    }
    
    func weight(from source: Vertex<AdjacencyList.Element>, to destination: Vertex<AdjacencyList.Element>) -> Double? {
        guard let edges = edges(from: source) else {
            return nil
        }
        
        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }
        return nil
    }
    
    func breadthFirstSearchTraverse(from source: Vertex<T>, to destination: Vertex<T>) -> [Vertex<T>] {
        var visits = [Vertex<T>]()
        var queue: Queue<Vertex<T>> = Queue<Vertex<T>>()
        queue.enqueue(source)
        visits.append(source)
        
        while let visitedVertext = queue.dequeue() {
            if let neighborEdges = self.edges(from: visitedVertext) {
                for edge in neighborEdges {
                    if visits.contains(edge.destination) == false {
                        queue.enqueue(edge.destination)
                        visits.append(edge.destination)
                    }
                }
            }
        }
        return visits
    }
    
    func breadthFirstSearchShortest(from source: Vertex<T>, to destination: Vertex<T>) -> [Vertex<T>] {
        var visits = [Vertex<T>:Edge<T>]()
        var queue: Queue<Vertex<T>> = Queue<Vertex<T>>()
        queue.enqueue(source)
        
        while let visitedVertext = queue.dequeue() {
            // found !!!
            if visitedVertext == destination {
                var results = [Vertex<T>]()
                var vertex = destination
                while let edge = visits[vertex] { // iterate visits from the destination
                    results = [edge.destination] + results
                    vertex = edge.source // next vertex
                    if vertex == source { // we reach source here, should add it to the result then break out
                        results = [vertex] + results
                        break
                    }
                }
                return results
            }
            
            // search next vertex
            if let neighborEdges = self.edges(from: visitedVertext) {
                for edge in neighborEdges {
                    if visits[edge.destination] == nil {
                        queue.enqueue(edge.destination)
                        visits[edge.destination] = edge // we replace value at edge.destination vertex with current edge
                    }
                }
            }
        }
        
        return [Vertex<T>]()
    }
    
    var description: CustomStringConvertible {
        var resultString = ""
        for (vertex, edges) in list {
            var edgesString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count-1 {
                    edgesString += "\(edge.destination), " // add ", " after name of destination
                } else {
                    edgesString += "\(edge.destination)" // last item, don't need ", "
                }
            }
            resultString += "From: \(vertex) ---> To: [\(edgesString)]\n"
        }
        return resultString
    }
}
