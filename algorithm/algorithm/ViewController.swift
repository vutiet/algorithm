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
//        playWithLinkedList()
//        playWithBinarySearchTree()
//        playWithGraph()
        
//        maximumSlice()
//        primeAndCompositeNumbers()
//        sieve()
//        euclidean()
//        fibonacciNumbers()
//        caterpillar()
//        greedy()
//        iterations()
//        arraywork()
//        timeComplexity()
//        prefixSums()
//        sortExercises()
//        stackQueueExercises()
        leaderExercises()
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
        catBreeds.remove(at: 3)
        print("catBreeds after remove at index 3: \(catBreeds)")
        
        catBreeds.remove(at: 1)
        print("catBreeds after remove at index 1: \(catBreeds)")
    }
    
    func playWithBinarySearchTree() {
        let tree1 = BinarySearchTree<Int>(value: 6)
        tree1.insert(value: 3)
        tree1.insert(value: 9)
        tree1.insert(value: 2)
        tree1.insert(value: 4)
        tree1.insert(value: 8)
        tree1.insert(value: 10)
//        let tree1 = BinarySearchTree<Int>(value: 2)
//        tree1.insert(value: 1)
//        tree1.insert(value: 3)
//        tree1.insert(value: 0)
//        tree1.insert(value: 7)
//        tree1.insert(value: 9)
//        tree1.insert(value: 1)
        print("tree1: \(tree1)")
        print("tree1 level: \(tree1.levelDescription())")
        
        var nodesByLevel = tree1.nodesByLevel()
        var nodeDesc = ""
        for node in nodesByLevel {
            nodeDesc += " \(node.value)"
        }
        print(nodeDesc)
        
        tree1.traverseLNR(process: { print($0) })
        tree1.traverseLRN(process: { print($0) })
        tree1.traverseNLR(process: { print($0) })
        
        let tree2 = BinarySearchTree<Int>(array: [7, 2, 5, 10, 9, 1])
        print("tree2: \(tree2)")
        
        print("tree1 height: \(tree1.height())")
        if let searchResult = tree1.search(value: 2) {
            print("searchResult: \(searchResult)")
            print("searchResult height: \(searchResult.height())")
            print("searchResult depth: \(searchResult.depth())")
            let afterRemovedTree = searchResult.remove()
            print("searchResult after remove: \(afterRemovedTree)")
            print("tree1 after remove: \(tree1)")
        }
        
        if let searchTree = tree1.search(value: 1) {
            searchTree.insert(value: 110)
            print("searchTree: \(searchTree)")
            print("tree1: \(tree1)")
            if tree1.isValidBST(minValue: Int.min, maxValue: Int.max) {
                print("YESSSSS it's valid")
            } else {
                print("NO, I SCREWED IT UP!!!!")
            }
        }
        
//        if tree1.isValidBST(minValue: Int.min, maxValue: Int.max) {
//            print("YESSSSS it's valid")
//        }
    }
    
    func playWithGraph() {
        let adjacencyList = AdjacencyList<String>()
        
        let singapore = adjacencyList.createVertex(data: "Singapore")
        let tokyo = adjacencyList.createVertex(data: "Tokyo")
        let hongKong = adjacencyList.createVertex(data: "Hong Kong")
        let detroit = adjacencyList.createVertex(data: "Detroit")
        let sanFrancisco = adjacencyList.createVertex(data: "San Francisco")
        let washingtonDC = adjacencyList.createVertex(data: "Washington DC")
        let austinTexas = adjacencyList.createVertex(data: "Austin Texas")
        let seattle = adjacencyList.createVertex(data: "Seattle")
    
        adjacencyList.add(from: singapore, to: hongKong, edgeType: .undirected, weight: 300)
        adjacencyList.add(from: singapore, to: tokyo, edgeType: .undirected, weight: 500)
        adjacencyList.add(from: hongKong, to: tokyo, edgeType: .undirected, weight: 250)
        adjacencyList.add(from: tokyo, to: detroit,  edgeType: .undirected, weight: 450)
        adjacencyList.add(from: tokyo, to: washingtonDC,  edgeType: .undirected, weight: 300)
        adjacencyList.add(from: hongKong, to: sanFrancisco,  edgeType: .undirected, weight: 600)
        adjacencyList.add(from: detroit, to: austinTexas,  edgeType: .undirected, weight: 50)
        adjacencyList.add(from: austinTexas, to: washingtonDC,  edgeType: .undirected, weight: 292)
        adjacencyList.add(from: sanFrancisco, to: washingtonDC,  edgeType: .undirected, weight: 337)
        adjacencyList.add(from: washingtonDC, to: seattle,  edgeType: .undirected, weight: 277)
        adjacencyList.add(from: sanFrancisco, to: seattle, edgeType: .undirected, weight: 218)
        adjacencyList.add(from: austinTexas, to: sanFrancisco,  edgeType: .undirected, weight: 297)
        
        print(adjacencyList.description)
        
        print("============================")
        print("\nBreadth First Search")
        let traverse = adjacencyList.breadthFirstSearchTraverse(from: singapore, to: seattle)
        print(traverse)
        let traverse2 = adjacencyList.breadthFirstSearchTraverse(from: tokyo, to: sanFrancisco)
        print(traverse2)
        
        let shortestPaths = adjacencyList.breadthFirstSearchShortest(from: seattle, to: detroit)
        print(shortestPaths)
        
        
        print("============================\n")
        let graph = AdjacencyList<String>()
        
        let nodeA = graph.createVertex(data: "a")
        let nodeB = graph.createVertex(data: "b")
        let nodeC = graph.createVertex(data: "c")
        let nodeD = graph.createVertex(data: "d")
        let nodeE = graph.createVertex(data: "e")
        let nodeF = graph.createVertex(data: "f")
        let nodeG = graph.createVertex(data: "g")
        let nodeH = graph.createVertex(data: "h")
        
        graph.add(from: nodeA, to: nodeB, edgeType: .directed, weight: nil)
        graph.add(from: nodeA, to: nodeC, edgeType: .directed, weight: nil)
        graph.add(from: nodeB, to: nodeD, edgeType: .directed, weight: nil)
        graph.add(from: nodeB, to: nodeE, edgeType: .directed, weight: nil)
        graph.add(from: nodeC, to: nodeF, edgeType: .directed, weight: nil)
        graph.add(from: nodeC, to: nodeG, edgeType: .directed, weight: nil)
        graph.add(from: nodeE, to: nodeH, edgeType: .directed, weight: nil)
        graph.add(from: nodeE, to: nodeF, edgeType: .directed, weight: nil)
        graph.add(from: nodeF, to: nodeG, edgeType: .directed, weight: nil)
       
        print(graph.description)
        print("============================")
        print("\nDepth First Search")
        let nodesExplored = graph.depthFirstSearchTraverse(from: nodeA)
        print(nodesExplored)
        
        let flightsExplored = adjacencyList.depthFirstSearchTraverse(from: seattle)
        print(flightsExplored)
        let paths = adjacencyList.depthFirstSearchPaths(from: seattle, to: detroit)
        print(paths)
    
    }
    
    func maximumSlice() {
        var array = [3, 2, -6, 4, 0]
        let maxSliceSum = MaximumSlice.maxSliceSum(&array)
        print(maxSliceSum)
        
        var array2 = [-3, -2]
        let maxSliceSum2 = MaximumSlice.maxSliceSum(&array2)
        print(maxSliceSum2)
    }
    
    func primeAndCompositeNumbers() {
        var coinsArray = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        let reverseCoins = PrimeCompositeNumber.reverseCoins(&coinsArray)
        print(reverseCoins)
    }
    
    func sieve() {
        print(SieveOfEratosthenes.sievePrimeNumber(17))
    }
    
    func euclidean() {
        let a = 15
        let b = 7
        let gcd = Euclidean.greatestCommonDivisor(a, b)
        print(gcd)
        
        let optimizeGCD = Euclidean.optimizeGCD(a, b, rest: 1)
        print(optimizeGCD)
        
        let lcm = Euclidean.leastCommonMultiple(a, b)
        print(lcm)
    }
    
    func fibonacciNumbers() {
        let fib = FibonacciNumber.fibonacciNumbers(10)
        print(fib)
    }
    
    func caterpillar() {
        let array = [6, 2, 7, 4, 1, 3, 6]
        let sum = 12
        let check = Caterpillar.checkExistenceOfSequence(in: array, sum: sum)
        print(check)
        
        let triangles = [2, 3, 4, 5, 6, 7, 8, 9, 10]
        let trianglesCount = Caterpillar.countTriangles(triangles)
        print(trianglesCount)
        
        let distinctArray = [3, 4, 5, 5, 2]
        let distinctSlicesCount = Caterpillar.countDistinctSlices(0, [0, 0, 0])
        print(distinctSlicesCount)
        
        let absArray = [-5, -3, -1, 0, 3, 6]
        let absDistinctCount = Caterpillar.absDistinctCount(absArray)
        print(absDistinctCount)
    }
    
    func greedy() {
        var ropes = [1, 2, 3, 4, 1, 1, 3]
        let tieRopes = Greedy.tieRopes(4, &ropes)
        print(tieRopes)
        var ropes2 = [2, 1]
        let tieRopes2 = Greedy.tieRopes(2, &ropes2)
        print(tieRopes2)
    }
    
    func iterations() {
        let n1 = 32
        let count1 = Iterations.binaryGapsCount(n1)
        print(count1)
        
        let n2 = 6
        let count2 = Iterations.binaryGapsCount(n2)
        print(count2)
        
        let n3 = 529
        let count3 = Iterations.binaryGapsCount(n3)
        print(count3)
        
        let n4 = 1041
        let count4 = Iterations.binaryGapsCount(n4)
        print(count4)
    }
    
    func arraywork() {
//        let array1 = [3, 8, 9, 7, 6]
//        let rotateArray1 = ArraysWork.rotationArray(array1, 3)
        var array1 = [-5, 1000]
        let rotateArray1 = ArraysWork.rotationArray(&array1, 1)
        print(rotateArray1)
        
        var array2 = [9, 3, 9, 3, 9, 7, 9]
        let oddOccurence = ArraysWork.checkOddOccurrencesInArray(&array2)
        print(oddOccurence)
        
    }
    
    func timeComplexity() {
        var array1 = [-1000, 1000]
        let result1 = TimeComplexity.tapeEquilibrium(&array1)
        print(result1)
    }
    
    func prefixSums() {
        let array1 = [2, 3, 7, 5, 1, 3, 9]
        let result1 = PrefixSums.pickMushrooms(array1, k: 4, m: 6)
        print(result1)
        
        let cars = [0, 1, 0, 1, 1]
        let passingCars = PrefixSums.countPassingCars(cars)
        print(passingCars)
    }
    
    func sortExercises() {
        var array1 = [2, 1, 1, 2, 3, 1]
        let result1 = SortExercise.countDistinctValues(&array1)
        print(result1)
        
        var array2 = [10, 2, 5, 1, 8, 20]
        let result2 = SortExercise.checkTriangle(&array2)
        print(result2)
        
        var array3 = [-3, 1, 2, -2, 5, 6]
        let result3 = SortExercise.maxProductOfThree(&array3)
        print(result3)
    }
    
    func stackQueueExercises() {
        var brackets = "{[()()]}"
        let validBrackets = StackQueueExercises.validateBrackets(&brackets)
        print(validBrackets)
        
        var nestString = "(()(())())"
        let validNestString = StackQueueExercises.validateNesting(&nestString)
        print(validNestString)
        
        var fishSizes = [4, 3, 2, 1, 5]
        var fishDirections = [0, 1, 0, 0 , 0]
        let aliveFishes = StackQueueExercises.countAliveFishes(&fishSizes, &fishDirections)
        print(aliveFishes)
        
        var wall = [8, 8, 5, 7, 9, 8, 7, 4, 8]
        let stones = StackQueueExercises.buildStoneWall(&wall)
        print(stones)
    }
    
    func leaderExercises() {
        let array  = [4, 6, 6, 6, 6, 8, 8]
        let (leaderCount, leaderValue) = Leader.findLeader(array)
        print("leader: \(leaderValue) ===== count: \(leaderCount)")
        
        var equiLeaderArray = [4, 3, 4, 4, 4, 2]
        let equiLeaders = Leader.findEquiLeaders(&equiLeaderArray)
        print("number of equi leaders: \(equiLeaders)")
        
        let arrayWithLeaders = [3, 4, 3, 2, 3, -1, 3, 3]
        let leaderIndex = Leader.findLeaderIndex(arrayWithLeaders)
        print("last index of leader: \(leaderIndex)")
    }
}

