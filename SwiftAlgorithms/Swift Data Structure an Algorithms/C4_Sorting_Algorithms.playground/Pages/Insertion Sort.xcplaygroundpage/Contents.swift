import Foundation

func insertionSort<T: Comparable>(_ list: inout [T]){
  
  if list.count <= 1 {
    return
  }
  
  for i in 1..<list.count {
    
    let x = list[i]
    var j = i
    
    while j > 0 && list[j - 1] > x {
      
      list[j] = list[j - 1]
      j -= 1
    }
    list[j] = x
  }
}

var smallSampleDataSet = makeArray(n: 10)

print(smallSampleDataSet)
var startSort = Date.timeIntervalSinceReferenceDate

insertionSort(&smallSampleDataSet)

var totalSortTime: [String : Double] = ["small-non-sorted" : Date.timeIntervalSinceReferenceDate - startSort]

print(smallSampleDataSet)


var midsizeSampleDataSet = makeArray(n: 100)

print(midsizeSampleDataSet)
startSort = Date.timeIntervalSinceReferenceDate

// midsizeSampleDataSet.insertionSort()

// totalSortTime["midsize-non-sorted"] = NSDate.timeIntervalSinceReferenceDate() - startSort

print(midsizeSampleDataSet)

var largeSampleDataSet = makeArray(n: 500)

print(largeSampleDataSet)
startSort = Date.timeIntervalSinceReferenceDate

// largeSampleDataSet.insertionSort()

// totalSortTime["large-non-sorted"] = NSDate.timeIntervalSinceReferenceDate() - startSort

print(largeSampleDataSet)

largeSampleDataSet = makeArray(n: 500).sorted()

print(largeSampleDataSet)
startSort = Date.timeIntervalSinceReferenceDate

// largeSampleDataSet.insertionSort()

// totalSortTime["large-ordered"] = NSDate.timeIntervalSinceReferenceDate() - startSort

largeSampleDataSet = makeArray(n: 500).sorted(by: >)

print(largeSampleDataSet)
startSort = Date.timeIntervalSinceReferenceDate

//largeSampleDataSet.insertionSort()

// totalSortTime["large-reverse-sorted"] = NSDate.timeIntervalSinceReferenceDate() - startSort

print(largeSampleDataSet)

totalSortTime
