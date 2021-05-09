#if !swift(>=3.0)
typealias IteratorProtocol = GeneratorType
typealias Sequence = SequenceType
typealias Collection = CollectionType
#endif

public struct PriorityQueue<T: Comparable> {
  
  fileprivate var heap = [T]()
  private let ordered: (T, T) -> Bool
  
  public init(ascending: Bool = false, startingValues: [T] = []) {
    
    if ascending {
      ordered = { $0 > $1 }
    } else {
      ordered = { $0 < $1 }
    }
    
    // Based on "Heap construction" from Sedgewick p 323
    heap = startingValues
    var i = heap.count/2 - 1
    while i >= 0 {
      sink(i)
      i -= 1
    }
  }
  
  /// How many elements the Priority Queue stores
  public var count: Int { return heap.count }
  
  /// true if and only if the Priority Queue is empty
  public var isEmpty: Bool { return heap.isEmpty }
  
  /// Add a new element onto the Priority Queue. O(lg n)
  ///
  /// - parameter element: The element to be inserted into the Priority Queue.
  public mutating func push(_ element: T) {
    heap.append(element)
    swim(heap.count - 1)
  }
  
  /// Remove and return the element with the highest priority (or lowest if ascending). O(lg n)
  ///
  /// - returns: The element with the highest priority in the Priority Queue, or nil if the PriorityQueue is empty.
  public mutating func pop() -> T? {
    
    if heap.isEmpty { return nil }
    if heap.count == 1 { return heap.removeFirst() }  // added for Swift 2 compatibility
    // so as not to call swap() with two instances of the same location
    heap.swapAt(0, heap.count - 1)
    let temp = heap.removeLast()
    sink(0)
    
    return temp
  }
  
  
  /// Removes the first occurence of a particular item. Finds it by value comparison using ==. O(n)
  /// Silently exits if no occurrence found.
  ///
  /// - parameter item: The item to remove the first occurrence of.
  public mutating func remove(_ item: T) {
    if let index = heap.firstIndex(of: item) {
      heap.swapAt(index, heap.count - 1)
      heap.removeLast()
      swim(index)
      sink(index)
    }
  }
  
  /// Removes all occurences of a particular item. Finds it by value comparison using ==. O(n)
  /// Silently exits if no occurrence found.
  ///
  /// - parameter item: The item to remove.
  public mutating func removeAll(_ item: T) {
    var lastCount = heap.count
    remove(item)
    while (heap.count < lastCount) {
      lastCount = heap.count
      remove(item)
    }
  }
  
  /// Get a look at the current highest priority item, without removing it. O(1)
  ///
  /// - returns: The element with the highest priority in the PriorityQueue, or nil if the PriorityQueue is empty.
  public func peek() -> T? {
    return heap.first
  }
  
  /// Eliminate all of the elements from the Priority Queue.
  public mutating func clear() {
    #if swift(>=3.0)
    heap.removeAll(keepingCapacity: false)
    #else
    heap.removeAll(keepCapacity: false)
    #endif
  }
  
  // Based on example from Sedgewick p 316
  private mutating func sink(_ index: Int) {
    var index = index
    while 2 * index + 1 < heap.count {
      
      var j = 2 * index + 1
      
      if j < (heap.count - 1) && ordered(heap[j], heap[j + 1]) { j += 1 }
      if !ordered(heap[index], heap[j]) { break }
      
      heap.swapAt(index, j)
      index = j
    }
  }
  
  // Based on example from Sedgewick p 316
  private mutating func swim(_ index: Int) {
    var index = index
    while index > 0 && ordered(heap[(index - 1) / 2], heap[index]) {
      heap.swapAt((index - 1) / 2, index)
      index = (index - 1) / 2
    }
  }
}

// MARK: - GeneratorType
extension PriorityQueue: IteratorProtocol {
  
  public typealias Element = T
  mutating public func next() -> Element? { return pop() }
}

// MARK: - SequenceType
extension PriorityQueue: Sequence {
  
  public typealias Iterator = PriorityQueue
  public func makeIterator() -> Iterator { return self }
}

// MARK: - CollectionType
extension PriorityQueue: Collection {
  
  public typealias Index = Int
  
  public var startIndex: Int { return heap.startIndex }
  public var endIndex: Int { return heap.endIndex }
  
  public subscript(i: Int) -> T { return heap[i] }
  
  #if swift(>=3.0)
  public func index(after i: PriorityQueue.Index) -> PriorityQueue.Index {
    return heap.index(after: i)
  }
  #endif
}

// MARK: - CustomStringConvertible, CustomDebugStringConvertible
extension PriorityQueue: CustomStringConvertible, CustomDebugStringConvertible {
  
  public var description: String { return heap.description }
  public var debugDescription: String { return heap.debugDescription }
}
