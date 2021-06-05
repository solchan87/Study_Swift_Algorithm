import Foundation

public func firstElement(array:[Int]) -> Int? {
    return array.first
}

public func fibonacci(number:Int) -> Int {
    if number <= 1 {
        return number
    }
    
    return fibonacci(number: number - 2) + fibonacci(number: number - 1)
}


public func test() {
    let number = 5
    let result = number + 4
    var myString:String = "Hey"
    
    
    let array:[Int] = [1,2,3,4]
    if array[0] == 1 {
        //O(1)
        print(array[0])
    }else {
        //O(array.lenght)
        for number in array {
            print(number)
        }
    }
    
    // n = 4
    let intArray:[Int] = [1,2,3,4]
    for number in intArray {
        // O(n) = 4 x O(1) = O(4)
        print(number)
    }
    
    
    let intsArray:[Int] = [1,2,3,4] //O(n) = 1
    var total = 0 //O(n) = 1
    for number in intsArray { //O(n) = 4^2 = 16
        for nestedNumber in intsArray {
            total = total + number * nestedNumber
        }
    }
    //O(n) = 16 + 1 + 1
}
