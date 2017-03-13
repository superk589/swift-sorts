//
//  Jesse Squires
//  http://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/swift-sorts
//
//  Copyright (c) 2014 Jesse Squires
//

func swiftSort(_ arr: [Int]) -> [Int]
{
    return arr.sorted();
}

func bubbleSort(_ array: [Int]) -> [Int] {
    var arr = array
    for i in 0..<arr.count {
        for j in 1..<arr.count - i {
            if arr[j] < arr[j - 1] {
                (arr[j], arr[j - 1]) = (arr[j - 1], arr[j])
            }
        }
    }
    return arr
}

func selectionSort(_ array: [Int]) -> [Int]
{
	var arr = array
    var minIndex = 0
    
    for i in 0..<arr.count {
        minIndex = i
        
        for j in (i + 1)..<arr.count {
            if arr[j] < arr[minIndex] {
                minIndex = j
            }
        }
        
        if (minIndex != i) {
            swap(&arr[i], &arr[minIndex])
        }
    }
    return arr;
}

func insertionSort(_ array: [Int]) -> [Int]
{
	var arr = array
    for i in 1..<arr.count {
        var j = i
        let target = arr[i]
        
        while j > 0 && target < arr[j - 1] {
            swap(&arr[j], &arr[j - 1])
            j -= 1
        }
        arr[j] = target
    }
    
    return arr;
}

func quickSort(_ array: [Int]) -> [Int]
{
	var arr = array
    quickSort(&arr, left: 0, right: arr.count - 1)
    return arr;
}

func quickSort(_ arr: inout [Int], left: Int, right: Int)
{
    let index = partition(&arr, left: left, right: right)
    
    if left < index - 1 {
        quickSort(&arr, left: left, right: index - 1)
    }
    
    if index < right {
        quickSort(&arr, left: index, right: right)
    }
}

func partition(_ arr: inout [Int], left: Int, right: Int) -> Int
{
    var i = left
    var j = right
    let pivot = arr[(left + right) / 2]
    
    while i <= j {
        while arr[i] < pivot {
            i += 1
        }
        
        while j > 0 && arr[j] > pivot {
            j -= 1
        }
        
        if i <= j {
            if i != j {
                swap(&arr[i], &arr[j])
            }
            i += 1
            
            if j > 0 {
                j -= 1
            }
        }
    }
    return i
}

func heapSort(_ array: [Int]) -> [Int]
{
	var arr = array
    heapify(&arr, count: arr.count)
    
    var end = arr.count - 1
    
    while end > 0 {
        swap(&arr[end], &arr[0])
        siftDown(&arr, start: 0, end: end - 1)
        end -= 1
    }
    
    return arr;
}

func heapify(_ arr: inout [Int], count: Int)
{
    var start = (count - 2) / 2
    
    while start >= 0 {
        siftDown(&arr, start: start, end: count - 1)
        start -= 1
    }
}

func siftDown(_ arr: inout [Int], start: Int, end: Int)
{
    var root = start
    
    while root * 2 + 1 <= end {
        var child = root * 2 + 1
        
        if child + 1 <= end && arr[child] < arr[child + 1] {
            child += 1
        }
        
        if arr[root] < arr[child] {
            swap(&arr[root], &arr[child])
            root = child
        }
        else {
            return
        }
    }
}


func mergeSort(array: [Int]) -> [Int] {
    var helper = Array(repeating: 0, count: array.count)
    var array = array
    mergeSort(array: &array, helper: &helper, low: 0, high: array.count - 1)
    return array
}

private func mergeSort(array: inout [Int], helper: inout [Int], low: Int, high: Int) {
    guard low < high else {
        return
    }
    let middle = (high - low) / 2 + low
    mergeSort(array: &array, helper: &helper, low: low, high: middle)
    mergeSort(array: &array, helper: &helper, low: middle + 1, high: high)
    merge(array: &array, helper: &helper, low: low, middle: middle, high: high)
    
}

private func merge(array: inout [Int], helper: inout [Int], low: Int, middle: Int, high: Int) {
    for i in low...high {
        helper[i] = array[i]
    }
    var helperLeft = low
    var helperRight = middle + 1
    var current = low
    while helperLeft <= middle && helperRight <= high {
        if helper[helperLeft] <= helper[helperRight] {
            array[current] = helper[helperLeft]
            helperLeft += 1
        } else {
            array[current] = helper[helperRight]
            helperRight += 1
        }
        current += 1
    }
    guard middle - helperLeft >= 0 else {
        return
    }
    for i in 0...middle - helperLeft {
        array[current + i] = helper[helperLeft + i]
    }
}
