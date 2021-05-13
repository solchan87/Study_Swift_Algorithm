import Foundation

private func merge<T: Comparable>(_ leftHalf: [T], rightHalf: [T]) -> [T] {
  
  var leftIndex = 0
  var rightIndex = 0
  var tmpList = [T]()
  tmpList.reserveCapacity(leftHalf.count + rightHalf.count)
  
  while (leftIndex < leftHalf.count && rightIndex < rightHalf.count) {
    if leftHalf[leftIndex] < rightHalf[rightIndex] {
      tmpList.append(leftHalf[leftIndex])
      leftIndex += 1
    }
    else if leftHalf[leftIndex] > rightHalf[rightIndex] {
      tmpList.append(rightHalf[rightIndex])
      rightIndex += 1
    }
    else {
      tmpList.append(leftHalf[leftIndex])
      tmpList.append(rightHalf[rightIndex])
      leftIndex += 1
      rightIndex += 1
    }
  }
  
  
  tmpList += [T](leftHalf[leftIndex..<leftHalf.count])
  tmpList += [T](rightHalf[rightIndex..<rightHalf.count])
  return tmpList
  
}

public func mergeSort<T: Comparable>(_ list: [T]) -> [T] {
  
  if list.count < 2 {
    return list
  }
  
  let center = (list.count) / 2
  return merge(mergeSort([T](list[0..<center])), rightHalf: mergeSort([T](list[center..<list.count])))
}

let smallSize = 50
let mediumSize = 500
let largeSize = 1000

var arr: [Int] = .init()
var startSort: TimeInterval = .init()
var totalSortTime: [String : Double] = .init()

//// MARK: small-random-array
//arr = makeArray(n: smallSize)
//startSort = Date.timeIntervalSinceReferenceDate
//arr
//arr = mergeSort(arr)
//totalSortTime = ["small-random-array" : Date.timeIntervalSinceReferenceDate - startSort]
//arr
//
//totalSortTime
//
//// MARK: small-sorted-array
//arr = makeArray(n: smallSize).sorted()
//startSort = Date.timeIntervalSinceReferenceDate
//arr
//
//arr = mergeSort(arr)
//totalSortTime["small-sorted-array"] = Date.timeIntervalSinceReferenceDate - startSort
//arr
//
//totalSortTime
//
//// MARK: small-reverse-sorted-array
//arr = makeArray(n: smallSize).sorted(by: >)
//startSort = Date.timeIntervalSinceReferenceDate
//
//arr = mergeSort(arr)
//totalSortTime["small-reverse-sorted-array"] = Date.timeIntervalSinceReferenceDate - startSort
//arr
//
//totalSortTime


//// MARK: medium-random-array
//arr = makeArray(n: mediumSize)
//startSort = Date.timeIntervalSinceReferenceDate
//
//arr = mergeSort(arr)
//totalSortTime["medium-random-array"] = Date.timeIntervalSinceReferenceDate - startSort
//arr
//
//totalSortTime
//
//// MARK: medium-sorted-array
//arr = makeArray(n: mediumSize).sorted()
//startSort = Date.timeIntervalSinceReferenceDate
//
//arr = mergeSort(arr)
//totalSortTime["medium-sorted-array"] = Date.timeIntervalSinceReferenceDate - startSort
//arr
//
//totalSortTime
//
//// MARK: medium-reverse-sorted-array
//arr = makeArray(n: mediumSize).sorted(by: >)
//startSort = Date.timeIntervalSinceReferenceDate
//
//arr = mergeSort(arr)
//totalSortTime["medium-reverse-sorted-array"] = Date.timeIntervalSinceReferenceDate - startSort
//arr
//
//totalSortTime

// MARK: large-random-array
arr = makeArray(n: largeSize)
startSort = Date.timeIntervalSinceReferenceDate

arr = mergeSort(arr)
totalSortTime["large-random-array"] = Date.timeIntervalSinceReferenceDate - startSort
arr

totalSortTime

// MARK: large-sorted-array
arr = makeArray(n: largeSize).sorted()
startSort = Date.timeIntervalSinceReferenceDate

arr = mergeSort(arr)
totalSortTime["large-sorted-array"] = Date.timeIntervalSinceReferenceDate - startSort
arr

totalSortTime

// MARK: large-reverse-sorted-array
arr = makeArray(n: largeSize).sorted(by: >)
startSort = Date.timeIntervalSinceReferenceDate

arr = mergeSort(arr)
totalSortTime["large-reverse-sorted-array"] = Date.timeIntervalSinceReferenceDate - startSort
arr

totalSortTime
