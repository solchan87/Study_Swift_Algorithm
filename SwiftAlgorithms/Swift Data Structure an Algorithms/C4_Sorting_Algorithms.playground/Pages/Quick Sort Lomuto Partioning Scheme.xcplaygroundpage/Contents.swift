import Foundation

func quickSort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) {
  
  if lo < hi {
    let pivot = partition(&list, lo: lo, hi: hi)
    quickSort(&list, lo: lo, hi: pivot - 1)
    quickSort(&list, lo: pivot + 1, hi: hi)
  }
}

func partition<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> Int {
  
  let pivot = list[hi]
  var i = lo
  for j in lo..<hi {
    if list[j] <= pivot {
      swap(&list, i, j)
      i += 1
    }
  }
  
  swap(&list, i, hi)
  return i
}

var arr = makeArray(n: 11)

arr


var startSort = Date.timeIntervalSinceReferenceDate

quickSort(&arr, lo: 0, hi: arr.count - 1)

var totalSortTime = Date.timeIntervalSinceReferenceDate - startSort

arr

totalSortTime
