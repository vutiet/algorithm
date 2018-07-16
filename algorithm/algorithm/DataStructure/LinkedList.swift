//
//  LinkedList.swift
//  algorithm
//
//  Created by Vu Tiet on 16/07/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T>: CustomStringConvertible {
    fileprivate var head: Node<T>?
    
    func insertHead(value: T) {
        let newNode = Node(value: value)
        if let head = head {
            newNode.next = head
            self.head = newNode
        } else {
            self.head = newNode
        }
    }
    
    func append(value: T) {
        let newNode = Node(value: value)
        if let head = head {
            var currentNode: Node? = head
            while(currentNode?.next != nil) {
                currentNode = currentNode?.next
            }
            currentNode?.next = newNode
        } else {
            self.head = newNode
        }
    }
    
    func node(at index: Int) -> Node<T>? {
        if index > 0 {
            var currentNode = head
            var currentIndex = 1
            while(currentNode?.next != nil) {
                if currentIndex == index {
                    return currentNode
                }
                currentNode = currentNode?.next
                currentIndex += 1
            }
        }
        return nil
    }
    
    func value(at index: Int) -> T? {
        let node = self.node(at: index)
        return node?.value
    }
    
    func remove(at index: Int) {
        if index > 1 {
            var currentNode = head
            var currentIndex = 1
            while(currentNode?.next != nil) {
                if currentIndex == index - 1 {
                    currentNode?.next = currentNode?.next?.next
                    break
                }
                currentIndex += 1
                currentNode = currentNode?.next
            }
        } else if index == 1 {
            self.head = head?.next
        }
    }
    
    public var description: String {
        var text = "["
        var node = head
        while node != nil {
            text += "\(node!.value)"
            node = node!.next
            if node != nil { text += ", " }
        }
        return text + "]"
    }
    
}
