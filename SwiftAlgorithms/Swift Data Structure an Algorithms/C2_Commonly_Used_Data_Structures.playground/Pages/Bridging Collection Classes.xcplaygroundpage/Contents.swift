import Foundation

let  nsFibonacciArray: NSArray = [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
let swiftFibonacciArray: [Int] = nsFibonacciArray as! [Int]

if let swiftFibonacciArray: [Int] = nsFibonacciArray as? [Int] {
    
}

let mixedNSArray: NSArray = NSArray(array: [0, 1, "1", 2, "3", 5, "8", 13, 21, 34])

if let swiftArrayMixed: [Int] = mixedNSArray as? [Int]{
    print("Type cast succeeded")
}
else {
    print("Type cast failed")
}
