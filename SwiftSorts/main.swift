//
//  Jesse Squires
//  http://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/swift-sorts
//
//  Copyright (c) 2014 Jesse Squires
//

let MAX_COUNT = 100_000

let NUM_TRIALS = 20

let benchmarks: [SortAlgorithmBenchmark] = [SortAlgorithmBenchmark(.swift),
                                            SortAlgorithmBenchmark(.quick),
                                            SortAlgorithmBenchmark(.heap),
                                            SortAlgorithmBenchmark(.merge),
                                            SortAlgorithmBenchmark(.insertion),
                                            SortAlgorithmBenchmark(.selection)]

for t in 1...NUM_TRIALS {
    print("::: TRIAL \(t) :::")

    var unsortedArray: [Int] = randomIntegerArray(MAX_COUNT)
    
    for sortBenchmark in benchmarks {
        _ = sortBenchmark.sortArray(unsortedArray)
    }
}

print("\nFinal Results:\n--------------")

for sort in benchmarks {
    print("\(sort.description)")
}

print("")
