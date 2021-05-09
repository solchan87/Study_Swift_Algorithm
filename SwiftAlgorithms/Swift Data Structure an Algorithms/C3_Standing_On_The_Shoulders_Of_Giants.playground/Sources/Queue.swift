import Foundation

public struct Queue<T> {
    
    fileprivate var data = [T]()
    
    // MARK: - Creating a Queue
    
    /// Constructs an empty Queue.
    public init() {}
    
    /// Constructs a Queue from a sequence.
    public init<S: Sequence>(_ elements: S) where S.Iterator.Element == T {
        data.append(contentsOf: elements)
    }
    
    // MARK: - Adding and Removing elements
    
    /// Removes and returns the first `element` in the queue.
    ///
    /// - returns:
    ///     - If the queue not empty, the first element of type `T`.
    ///     - If the queue is empty, 'nil' is returned.
    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    /// Returns the first `element` in the queue without removing it.
    ///
    /// - returns:
    ///     - If the queue not empty, the first element of type `T`.
    ///     - If the queue is empty, 'nil' is returned.
    public func peek() -> T? {
        return data.first
    }
    
    /// Appends `element` to the end of the queue.
    ///
    /// - complexity: O(1)
    /// - parameter element: An element of type `T`
    public mutating func enqueue(element: T) {
        data.append(element)
    }
    
    // MARK: - Helpers for a Circular Buffer
    
    /// Resets the buffer to an empty state
    public mutating func clear() {
        data.removeAll()
    }
    
    /// Returns the number of elements in the queue.
    ///
    /// `count` is the number of elements in the queue.
    public var count: Int {
        return data.count
    }
    
    /// Returns the capacity of the queue.
    public var capacity: Int {
        get {
            return data.capacity
        }
        
        set {
            data.reserveCapacity(newValue)
        }
    }
    
    /// Check if the queue is full.
    ///
    /// - returns: `True` if the queue is full, otherwise it returns `False`.
    public func isFull() -> Bool {
        return count == data.capacity
    }
    
    /// Check if the queue is empty.
    ///
    /// - returns: `True` if the queue is empty, otherwise it returns `False`.
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
    
    /// Verifies `index` is within range
    fileprivate func checkIndex(index: Int) {
        if index < 0 || index > count {
            fatalError("Index out of range")
        }
    }
    
}

// MARK: - CustomStringConvertible, CustomDebugStringConvertible
extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return data.description
    }
    
    public var debugDescription: String {
        return data.debugDescription
    }
}

extension Queue: Sequence {
    // MARK: Sequence protocol conformance
    
    /// Returns an *iterator* over the elements of this *sequence*.
    ///
    /// - Complexity: O(1).
    public func generate() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: data.lazy))
    }
}

extension Queue: ExpressibleByArrayLiteral {
    
    // MARK: ExpressibleByArrayLiteral protocol conformance
    
    /// Constructs a queue using an array literal.
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

extension Queue: Collection {
    /// Returns the position immediately after the given index.
    ///
    /// - Parameter i: A valid index of the collection. `i` must be less than
    ///   `endIndex`.
    /// - Returns: The index value immediately after `i`.
    public func index(after i: Int) -> Int {
        return data.index(after: i)
    }

    
}

extension Queue: MutableCollection {
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return count - 1
    }
    
    public subscript(index: Int) -> T {
        get {
            checkIndex(index: index)
            return data[index]
        }
        
        set {
            checkIndex(index: index)
            data[index] = newValue
        }
    }
}

// MARK: - CircularBuffer internal contants
private struct Constants {
    private static let defaultQueueCapacity:Int = 16
}

// MARK: - Queue Full Operations
/// Control the queue full behavior when adding new elements
public enum QueueFullOperation {
    case AutoAllocate, FixedSize
}
