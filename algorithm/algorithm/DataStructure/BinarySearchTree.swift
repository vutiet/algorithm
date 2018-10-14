//
//  BinarySearchTree.swift
//  algorithm
//
//  Created by Vu Tiet on 16/07/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import Foundation

class BinarySearchTree<T: Comparable>: CustomStringConvertible {
    private(set) var value: T
    private(set) var parent: BinarySearchTree?
    private(set) var left: BinarySearchTree?
    private(set) var right: BinarySearchTree?
    
    init(value: T) {
        self.value = value
    }
    
    convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for element in array.dropFirst() { // run from 1
            insert(value: element)
        }
    }
    
    func isRoot() -> Bool {
        return parent == nil
    }
    
    func isLeaf() -> Bool {
        return left == nil && right == nil
    }
    
    func isLeftChild() -> Bool {
        return parent?.left === self // check reference pointer
    }
    
    func isRightChild() -> Bool {
        return parent?.right === self
    }
    
    func hasLeftChild() -> Bool {
        return left != nil
    }
    
    func hasRightChild() -> Bool {
        return right != nil
    }
    
    func isSibling(with node: BinarySearchTree) -> Bool {
        if let selfParent = self.parent, node.isChild(of: selfParent) {
            return true
        }
        return false
    }
    
    func isNephew(of node: BinarySearchTree) -> Bool {
        if let selfParent = self.parent, selfParent.isSibling(with: node) {
            return true
        }
        return false
    }
    
    func isChild(of node: BinarySearchTree) -> Bool {
        if let selfParent = self.parent, selfParent.value == node.value {
            return true
        }
        return false
    }
    
    func count() -> Int {
        return (left?.count() ?? 0) + 1 + (right?.count() ?? 0)
    }
    
    func height() -> Int {
        if isLeaf() {
            return 0
        }
        
        return (left?.height() ?? 0) + 1 + (right?.height() ?? 0)
    }
    
    func depth() -> Int {
        var node = self
        var edges = 0
        while node.parent != nil {
            edges += 1
            node = node.parent!
        }
        return edges
    }
    
    func minimum() -> BinarySearchTree {
        let node = self
        if let left = left {
            return left.minimum()
        } else {
            return node
        }
    }
    
    func maximum() -> BinarySearchTree {
        let node = self
        if let right = right {
            return right.maximum()
        } else {
            return node
        }
    }
    
    func isValidBST(minValue: T, maxValue: T) -> Bool {
        if value < minValue || value > maxValue {
            return false
        }
        let validLeft = left?.isValidBST(minValue: minValue, maxValue: value) ?? true
        let validRight = right?.isValidBST(minValue: value, maxValue: maxValue) ?? true
        return validLeft && validRight
    }

    
    func insert(value: T) {
        if value < self.value {
            if let leftTree = left {
                leftTree.insert(value: value) // recursive call
            } else { // leaf node, just insert
                let newNode = BinarySearchTree(value: value)
                newNode.parent = self
                left = newNode
            }
        } else {
            if let rightTree = right {
                rightTree.insert(value: value)
            } else {
                let newNode = BinarySearchTree(value: value)
                newNode.parent = self
                right = newNode
            }
        }
    }
    
    @discardableResult func remove() -> BinarySearchTree? {
        print("remove node: \(self)")
        let replacement: BinarySearchTree?
        
        // find replacement for current node
        if let leftTree = left {
            replacement = leftTree.maximum()
        } else if let rightTree = right {
            replacement = rightTree.minimum()
        } else {
            replacement = nil
        }
        
        print("replacement: \(replacement)")
        replacement?.remove() // MUST call this to point left / right of replacement's parent to nil
        
        // replace current node with replacement
        replacement?.left = left
        replacement?.right = right
        left?.parent = replacement
        right?.parent = replacement
        
        // replace replacement as a new child of current node's parent
        if let parent = parent {
            if isLeftChild() == true {
                parent.left = replacement
            } else {
                parent.right = replacement
            }
            replacement?.parent = parent
        }
        
        // remove current node
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    private func reconnectParentTo(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild() {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
    
    func search(value: T) -> BinarySearchTree? {
        
        if value == self.value {
            return self
        }
        
        if value < self.value {
            return left?.search(value: value)
        } else if value > self.value {
            return right?.search(value: value)
        } else {
            return nil
        }
    }
    
    func traverseLNR(process: (T) -> Void) {
        left?.traverseLNR(process: process)
        process(value)
        right?.traverseLNR(process: process)
    }
    
    func traverseLRN(process: (T) -> Void) {
        left?.traverseLRN(process: process)
        right?.traverseLRN(process: process)
        process(value)
    }
    
    func traverseNLR(process: (T) -> Void) {
        process(value)
        left?.traverseNLR(process: process)
        right?.traverseNLR(process: process)
    }
    
    
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
    
    func levelDescription() -> String {
        var s = "tree by level: \n"
        let nodes = nodesByLevel()
        for i in 0..<nodes.count {
            let node = nodes[i]
            print("current node: \(node.value)")
            if node.isRoot() {
                s += "(\(node.value))"
            } else { // index > 0 from here
                let previousNode = nodes[i-1]
                if node.isChild(of: previousNode) || node.isNephew(of: previousNode) {
                    s += "\n(\(node.value))"
                } else if node.isSibling(with: previousNode) {
                    s += ", (\(node.value))"
                } else if let uncleNode = previousNode.parent, node.isNephew(of: uncleNode) {
                    s += ", (\(node.value))"
                }
            }
            print(s)
        }
        return s
    }
    
    func nodesByLevel() -> [BinarySearchTree] {
        guard isRoot() else {
            return [BinarySearchTree]()
        }
        var queue = [BinarySearchTree]()
        queue.append(self)
        let nodesCount = count()
        var index = 0
        while index < nodesCount {
    
            let node = queue[index]
            if let left = node.left {
                queue.append(left)
            }
                
            if let right = node.right {
                queue.append(right)
            }
            
            index += 1
        }
        return queue
    }
}




