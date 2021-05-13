import Foundation

func quickSort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) {
  
  if lo < hi {
    let pivot = partition(&list, lo: lo, hi: hi)
    quickSort(&list, lo: lo, hi: pivot)
    quickSort(&list, lo: pivot + 1, hi: hi)
    
  }
}

private func partition<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> Int {
  
  let pivot = list[lo]
  var i = lo - 1
  var j = hi + 1
  
  while true {
    
    i += 1
    while list[i] < pivot { i += 1}
    j -= 1
    while list[j] > pivot { j -= 1 }
    if i >= j {
      return j
    }
    swap(&list[i], &list[j])
  }
}

var arr = makeArray(n: 11)

arr


var startSort = Date.timeIntervalSinceReferenceDate

quickSort(&arr, lo: 0, hi: arr.count - 1)

var totalSortTime = Date.timeIntervalSinceReferenceDate - startSort

arr

print("high")

totalSortTime
