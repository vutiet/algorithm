//
//  ViewController.swift
//  algorithm
//
//  Created by Vu Tiet on 16/07/2018.
//  Copyright © 2018 Ti3t. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onButtonTap(_ sender: Any) {
//        playWithStack()
//        playWithQueue()
        playWithLinkedList()
    }
    
    
    func playWithStack() {
        var rwBookStack = Stack<String>()
        rwBookStack.push("1/3D Games by Tutorials")
        rwBookStack.push("2/tvOS Apprentice")
        rwBookStack.push("3/iOS Apprentice")
        rwBookStack.push("4/Swift Apprentice")
        print(rwBookStack)
        
        if let lastBook = rwBookStack.peek() {
            print("lastBook: \(lastBook)")
        }
        
        let popBook = rwBookStack.pop()
        print("popBook: \(popBook)")
        print(rwBookStack)
    }
    
    func playWithQueue() {
        var bookQueue = Queue<String>()
        bookQueue.enqueue("1/3D Games by Tutorials")
        bookQueue.enqueue("2/tvOS Apprentice")
        bookQueue.enqueue("3/iOS Apprentice")
        bookQueue.enqueue("4/Swift Apprentice")
        print(bookQueue)
        
        if let firstBook = bookQueue.peek() {
            print("firstBook: \(firstBook)")
        }
        
        if let dequeueBook = bookQueue.dequeue() {
            print("dequeueBook: \(dequeueBook)")
            print(bookQueue)
        }
        
    }
    
    func playWithLinkedList() {
        let dogBreeds = LinkedList<String>()
        dogBreeds.insertHead(value: "1/Labrador")
        dogBreeds.insertHead(value: "2/Bulldog")
        dogBreeds.insertHead(value: "3/Beagle")
        dogBreeds.insertHead(value: "4/Husky")
        print(dogBreeds)
        if let thirdDog = dogBreeds.value(at: 3) {
            print("the 3rd Dog: \(thirdDog)")
        }
        
        let catBreeds = LinkedList<String>()
        catBreeds.append(value: "1/American Curl")
        catBreeds.append(value: "2/Bombay")
        catBreeds.append(value: "3/Dwelf")
        catBreeds.append(value: "4/Khao Manee")
        print(catBreeds)
        if let thirdCat = catBreeds.value(at: 3) {
            print("the 3rd cat: \(thirdCat)")
        }
        
        
    }
}

