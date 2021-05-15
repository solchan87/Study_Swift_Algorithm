//Compile Test


import Foundation

func insertionSort<T: Comparable>(_ list: inout [T]){
  
  // 1개의 리스트는 반환
  if list.count <= 1 {
    return
  }
  
  // 1번째 index부터 반환
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

// MARK: Sources - Make linked list
public struct LinkedList<T> where T: Comparable {
  
  private var _head: Node<T>? = nil
  
  private var _count: Int = 0
  
  public init() {}
  
  public init<S : Sequence>(_ s: S) where S.Iterator.Element == T {
    for el in s {
      push(el)
    }
  }
  
  public mutating func push(_ element: T) {
    let node = Node<T>(data: element)
    node.next = head
    head = node
    _count += 1
  }
  
  public mutating func pop() -> T? {
    if isEmpty() {
      return nil
    }
    
    // Get the item of the head node.
    let item = head?.data
    
    // Remove the head node.
    head = head?.next
    
    // decrement number of elements
    _count -= 1
    
    return item
  }
  
  public func peek() -> T? {
    return head?.data
  }
  
  public func isEmpty() -> Bool {
    return count == 0
  }
  
  public var count: Int {
    return _count
  }
  
  public var head: Node<T>? {
    get {
      return _head
    }
    
    set {
      _head = newValue
    }
  }
}

public struct NodeIterator<T> : IteratorProtocol where T: Comparable {
  
  public typealias Element = T
  
  private var head: Node<Element>?
  
  init(head: Node<T>?){
    self.head = head
  }
  
  mutating public func next() -> T? {
    if (head != nil) {
      let item = head!.data
      head = head!.next
      return item
    }
    return nil
  }
}


extension LinkedList: Sequence {
  
  public typealias Iterator = NodeIterator<T>
  
  public func makeIterator() -> NodeIterator<T> {
    return NodeIterator<T>(head: head)
  }
}

//extension StackList: ArrayLiteralConvertible {
//
//    public init(arrayLiteral elements: T...) {
//        print("inside init")
//        for el in elements {
//            print("Array Literal...pushing el: \(el)")
//            push(el)
//        }
//    }
//}


public class Node<T> where T: Comparable {
  public var next: Node<T>?
  
  public var data: T
  
  init(data: T) {
    next = nil
    self.data = data
  }
  
}

// MARK: Sources - Make linked list
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

// MARK: merge sort - array
public func merge<T: Comparable>(_ leftHalf: [T], rightHalf: [T]) -> [T] {
  
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

// MARK: merge sort - linked list
public func frontBackSplit<T: Comparable>( list: inout LinkedList<T>, front: inout Node<T>?, back: inout Node<T>?){
  
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

public func merge<T: Comparable>(left: Node<T>?, right: Node<T>?) -> Node<T>? {
  
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


// MARK: Test
func testArray() {
  
  // MARK: array 100
  let array100 = makeArray(n: 100)
  let startSort100 = Date.timeIntervalSinceReferenceDate
  let _ = mergeSort(array100)
  print("Array(100): \(Date.timeIntervalSinceReferenceDate - startSort100)")
  
  // MARK: array 1000
  let array1000 = makeArray(n: 1000)
  let startSort1000 = Date.timeIntervalSinceReferenceDate
  let _ = mergeSort(array1000)
  print("Array(1,000): \(Date.timeIntervalSinceReferenceDate - startSort1000)")
  
  // MARK: array 10000
  let array10000 = makeArray(n: 10000)
  let startSort10000 = Date.timeIntervalSinceReferenceDate
  let _ = mergeSort(array10000)
  print("Array(10,000): \(Date.timeIntervalSinceReferenceDate - startSort10000)")
}

func testLinkedList() {
 
  // MARK: linked list 100
  var list100 = makeList(n: 100)
  let startSort100 = Date.timeIntervalSinceReferenceDate
  let _ = mergeSort(list: &list100)
  print("Linked List(100): \(Date.timeIntervalSinceReferenceDate - startSort100)")
  
  // MARK: linked list 1000
  var list1000 = makeList(n: 1000)
  let startSort1000 = Date.timeIntervalSinceReferenceDate
  let _ = mergeSort(list: &list1000)
  print("Linked List(1,000): \(Date.timeIntervalSinceReferenceDate - startSort1000)")
  
  // MARK: linked list 10000
  var list10000 = makeList(n: 10000)
  let startSort10000 = Date.timeIntervalSinceReferenceDate
  let _ = mergeSort(list: &list10000)
  print("Linked List(10,000): \(Date.timeIntervalSinceReferenceDate - startSort10000)")
}


func testInsert() {
  
  // MARK: array 100
  var array100 = makeArray(n: 100)
  let startSort100 = Date.timeIntervalSinceReferenceDate
  let _ = insertionSort(&array100)
  print("Insertion(100): \(Date.timeIntervalSinceReferenceDate - startSort100)")
  
  // MARK: array 1000
  var array1000 = makeArray(n: 1000)
  let startSort1000 = Date.timeIntervalSinceReferenceDate
  let _ = insertionSort(&array1000)
  print("Insertion(1,000): \(Date.timeIntervalSinceReferenceDate - startSort1000)")
  
  // MARK: array 10000
  var array10000 = makeArray(n: 10000)
  let startSort10000 = Date.timeIntervalSinceReferenceDate
  let _ = insertionSort(&array10000)
  print("Insertion(10,000): \(Date.timeIntervalSinceReferenceDate - startSort10000)")
}

testInsert()
testArray()
testLinkedList()
