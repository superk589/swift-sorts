//
//  Jesse Squires
//  http://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/swift-sorts
//
//  Copyright (c) 2014 Jesse Squires
//

import XCTest

class SwiftSortsPerformanceTests: XCTestCase {
    
    let maxCount = 1_000
    var randomArray : [Int]? = nil
    
    override func setUp() {
        super.setUp()
        self.randomArray = randomIntegerArray(self.maxCount)
    }
    
    override func tearDown() {
        self.randomArray = nil
        super.tearDown()
    }
    
    func testSwiftSortPerformance() {
        self.measure() {
            _ = swiftSort(self.randomArray!)
        }
    }
    
    func testQuickSortPerformance() {
        self.measure() {
            _ = quickSort(self.randomArray!)
        }
    }
    
    func testHeapSortPerformance() {
        self.measure() {
            _ = heapSort(self.randomArray!)
        }
    }
    
    func testInsertionSortPerformance() {
        self.measure() {
            _ = insertionSort(self.randomArray!)
        }
    }
    
    func testSelectionSortPerformance() {
        self.measure() {
            _ = selectionSort(self.randomArray!)
        }
    }
}
