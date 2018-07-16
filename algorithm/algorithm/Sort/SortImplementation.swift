//
//  SortImplementation.swift
//  duthutrendoi
//
//  Created by Vu Tiet on 11/07/2018.
//  Copyright © 2018 Vu Tiet. All rights reserved.
//

import UIKit

class SortImplementation: NSObject {

    func selectionSort(_ array: [Int]) -> [Int] {
        var sortedArray = array
        for i in 0..<sortedArray.count {
            // find min here
            var minIndex = i
            for j in i..<sortedArray.count {
                if sortedArray[j] < sortedArray[minIndex] {
                    minIndex = j
                }
            }
            let minValue = sortedArray[minIndex]
            sortedArray[minIndex] = sortedArray[i]
            sortedArray[i] = minValue
        }
        return sortedArray
    }
    
    func quickSort(_ array: inout [Int], low: Int, high: Int) {
        if low < high {
            let partition = quickSortPartition(&array, low: low, high: high)
            quickSort(&array, low: low, high: partition-1)
            quickSort(&array, low: partition+1, high: high)
        }
    }
    
    func quickSortPartition(_ array: inout [Int], low: Int, high: Int) -> Int {
        let pivot = array[high]
        
        var index = low
        for i in low..<high {
            if array[i] < pivot {
                (array[index], array[i]) = (array[i], array[index])
                index += 1
            }
        }
        
        (array[index], array[high]) = (array[high], array[index])
        print("quickSortPartition: \(low) - \(high) => new index: \(index) \n\(array)")
        return index
    }
    
    func mergeSort(_ array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array
        }
        
        let middleIndex = array.count / 2
        let leftArray = mergeSort(Array(array[0..<middleIndex]))
        let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
        return mergeSortMergeArrays(leftArray: leftArray, rightArray: rightArray)
    }
    
    private func mergeSortMergeArrays(leftArray: [Int], rightArray: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var mergedArray = [Int]()
        while (leftIndex < leftArray.count && rightIndex < rightArray.count) {
            if leftArray[leftIndex] < rightArray[rightIndex] {
                mergedArray.append(leftArray[leftIndex])
                leftIndex += 1
            } else if (rightArray[rightIndex] < leftArray[leftIndex]) {
                mergedArray.append(rightArray[rightIndex])
                rightIndex += 1
            } else {
                mergedArray.append(leftArray[leftIndex])
                mergedArray.append(rightArray[rightIndex])
                leftIndex += 1
                rightIndex += 1
            }
        }
        
        // push the rest of items to merged array
        while (leftIndex < leftArray.count) {
            mergedArray.append(leftArray[leftIndex])
            leftIndex += 1
        }
        
        while (rightIndex < rightArray.count) {
            mergedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
        
        print("mergeSortMergeArrays \(leftArray) + \(rightArray) => \(mergedArray)")
        return mergedArray
    }
    
}
