import Foundation

var greeting = "Hello, playground"

public func quickSort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) {
    
    if lo < hi {
      let median = getMedianOfThree(&list, lo: lo, hi: hi)
      let pivot = partition(&list, lo: lo, hi: hi, median: median)
      quickSort(&list, lo: lo, hi: pivot)
      quickSort(&list, lo: pivot + 1, hi: hi)
      
  }
}

private func getMedianOfThree<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> T {
  
  let center = lo + (hi - lo) / 2
  
  if list[lo] > list[center] {
    list.swapAt(lo, center)
  }
  if list[lo] > list[hi] {
    list.swapAt(lo, hi)
  }
  if list[center] > list[hi] {
    list.swapAt(center, hi)
  }
  list.swapAt(center, hi)
  
  return list[hi]
}

private func partition<T: Comparable>(_ list: inout [T], lo: Int, hi: Int, median: T) -> Int {
    
    var i = lo - 1
    var j = hi + 1
    //: Create infinate loop
    while true {

      i += 1
      while list[i] < median { i += 1 }

      j -= 1
      while list[j] > median { j -= 1 }

      if i >= j {
          return j
      }
      list.swapAt(i, j)
  }

}

var arr = makeArray(n: 11)

arr


var startSort = Date.timeIntervalSinceReferenceDate

quickSort(&arr, lo: 0, hi: arr.count - 1)

var totalSortTime = Date.timeIntervalSinceReferenceDate - startSort

arr

totalSortTime
