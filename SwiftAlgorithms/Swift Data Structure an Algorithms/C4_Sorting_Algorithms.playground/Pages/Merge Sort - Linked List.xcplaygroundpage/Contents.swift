import Foundation

private func frontBackSplit<T: Comparable>( list: inout LinkedList<T>, front: inout Node<T>?, back: inout Node<T>?){
  
  var fast: Node<T>?
  var slow: Node<T>?
  
  if list.head == nil || list.head?.next == nil {
    front = list.head
    back = nil
  }
  else {
    slow = list.head
    fast = list.head?.next
    
    while fast != nil {
      fast = fast?.next
      if fast != nil {
        slow = slow?.next
        fast = fast?.next
      }
    }
    
    front = list.head
    back = slow?.next
    slow?.next = nil
  }
}

private func merge<T: Comparable>(left: Node<T>?, right: Node<T>?) -> Node<T>? {
  
  var result: Node<T>? = nil
  
  if left == nil {
    return right
  }
  else if right == nil {
    return left
  }
  
  if left!.data <= right!.data {
    result = left
    result?.next = merge(left: left?.next, right: right)
  }
  else {
    result = right
    result?.next = merge(left: left, right: right?.next)
  }
  
  return result
}


func mergeSort<T: Comparable>( list: inout LinkedList<T>) {
  
  var left: Node<T>? = nil
  var right: Node<T>? = nil
  
  if list.head == nil || list.head?.next == nil {
    return
  }
  
  frontBackSplit(list: &list, front: &left, back: &right)
  
  var leftList = LinkedList<T>()
  leftList.head = left
  
  var rightList = LinkedList<T>()
  rightList.head = right
  
  mergeSort(list: &leftList)
  mergeSort(list: &rightList)
  
  list.head = merge(left: leftList.head, right: rightList.head)
}

let smallSize = 50
let mediumSize = 500
let largeSize = 1000

var list: LinkedList<Int> = .init()
var startSort: TimeInterval = .init()
var totalSortTime: [String : Double] = .init()


//// MARK: small-random-list
//list = makeList(n: smallSize)
//
//startSort = NSDate.timeIntervalSinceReferenceDate
//mergeSort(list: &list)
//totalSortTime = ["small-random-list" : Date.timeIntervalSinceReferenceDate - startSort]
//
//list
//
//totalSortTime
//
//// MARK: small-sorted-list
//list = makeList(n: smallSize, sorted: true)
//
//startSort = NSDate.timeIntervalSinceReferenceDate
//mergeSort(list: &list)
//totalSortTime["small-sorted-list"] = Date.timeIntervalSinceReferenceDate - startSort
//
//list
//
//totalSortTime
//
//// MARK: small-reverse-sorted-list
//list = makeList(n: smallSize, sorted: false, reverseSorted: true)
//
//startSort = NSDate.timeIntervalSinceReferenceDate
//mergeSort(list: &list)
//totalSortTime["small-reverse-sorted-list"] = Date.timeIntervalSinceReferenceDate - startSort
//
//list
//
//totalSortTime


//// MARK: medium-random-list
//list = makeList(n: mediumSize)
//
//startSort = NSDate.timeIntervalSinceReferenceDate
//mergeSort(list: &list)
//totalSortTime = ["medium-random-list" : Date.timeIntervalSinceReferenceDate - startSort]
//
//list
//
//totalSortTime
//
//// MARK: medium-sorted-list
//list = makeList(n: mediumSize, sorted: true)
//
//startSort = NSDate.timeIntervalSinceReferenceDate
//mergeSort(list: &list)
//totalSortTime["medium-sorted-list"] = Date.timeIntervalSinceReferenceDate - startSort
//
//list
//
//totalSortTime
//
//// MARK: medium-reverse-sorted-list
//list = makeList(n: mediumSize, sorted: false, reverseSorted: true)
//
//startSort = NSDate.timeIntervalSinceReferenceDate
//mergeSort(list: &list)
//totalSortTime["medium-reverse-sorted-list"] = Date.timeIntervalSinceReferenceDate - startSort
//
//list
//
//totalSortTime

// MARK: large-random-list
list = makeList(n: largeSize)

startSort = NSDate.timeIntervalSinceReferenceDate
mergeSort(list: &list)
totalSortTime["large-random-list"] = Date.timeIntervalSinceReferenceDate - startSort

list

totalSortTime

// MARK: large-sorted-list
list = makeList(n: largeSize, sorted: true)

startSort = NSDate.timeIntervalSinceReferenceDate
mergeSort(list: &list)
totalSortTime["large-sorted-list"] = Date.timeIntervalSinceReferenceDate - startSort

list

totalSortTime

// MARK: large-reverse-sorted-list
list = makeList(n: largeSize, sorted: false, reverseSorted: true)

startSort = NSDate.timeIntervalSinceReferenceDate
mergeSort(list: &list)
totalSortTime["large-reverse-sorted-list"] = Date.timeIntervalSinceReferenceDate - startSort

list

totalSortTime
