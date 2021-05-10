import Foundation


public func makeArray(n: Int ) -> [Int] {
    var result:[Int] = []
    for _ in 0..<n {
        result.append(Int(arc4random_uniform(2000) + 1))
    }
    return result
}

public func makeList(n: Int, sorted: Bool = false, reverseSorted: Bool = false) -> LinkedList<Int> {
    var result = LinkedList<Int>()
    
    if sorted == false {
        for _ in 0..<n {
            result.push(Int(arc4random_uniform(2000) + 1))
        }
    }
    else {
        if reverseSorted == true {
            for i in stride(from: n, to: 0, by: -1){
                result.push(i)
            }
        }
        else {
            for i in 0 ..< n {
                result.push(i)
            }
        }
    }
    return result
}

public func swap<T>( _ list: inout [T], _ a: Int, _ b: Int) {
    if a != b {
      list.swapAt(a, b)
    }
}
