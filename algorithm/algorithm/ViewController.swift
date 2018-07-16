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
        playWithStack()
    }
    
    
    func playWithStack() {
        var rwBookStack = Stack<String>()
        rwBookStack.push("3D Games by Tutorials")
        rwBookStack.push("tvOS Apprentice")
        rwBookStack.push("iOS Apprentice")
        rwBookStack.push("Swift Apprentice")
        print(rwBookStack)
        
        let lastBook = rwBookStack.peek()
        print("lastBook: \(lastBook) ?? no book")
        
        let popBook = rwBookStack.pop()
        print("popBook: \(popBook)")
        
        print(rwBookStack)
        
    }
}

