import Foundation

func makeList(n:Int ) -> [Int] {
  var result:[Int] = []
  for _ in 0..<n {
    result.append(Int(arc4random_uniform(20) + 1))
  }
  return result
}


func mergeSort<T:Comparable>( list:inout [T]) {
  if list.count <= 1 {
    return
  }
  
  func merge( left:[T], right:[T]) -> [T] {
    var left = left
    var right = right
    var result = [T]()
    
    while left.count != 0 && right.count != 0 {
      if left[0] <= right[0] {
        result.append(left.remove(at: 0))
      } else {
        result.append(right.remove(at: 0))
      }
    }
    
    while left.count != 0 {
      result.append(left.remove(at: 0))
    }
    
    while right.count != 0 {
      result.append(right.remove(at: 0))
    }
    
    return result
  }
  
  var left = [T]()
  var right = [T]()
  
  let mid = list.count / 2
  
  for i in 0..<mid {
    left.append(list[i])
  }
  
  for i in mid..<list.count {
    right.append(list[i])
  }
  
  mergeSort(list: &left)
  mergeSort(list: &right)
  
  list = merge(left: left, right: right)
}

for i in 1...10 {
  
  var myRandomList: [Int] = makeList(n: i * 100)
  let start = NSDate()
  mergeSort(list: &myRandomList)
  let end = NSDate()
  let timeInterval: Double = end.timeIntervalSince(start as Date)
  
  print("Array size = \(myRandomList.count), time = \(timeInterval) / sec")
}
