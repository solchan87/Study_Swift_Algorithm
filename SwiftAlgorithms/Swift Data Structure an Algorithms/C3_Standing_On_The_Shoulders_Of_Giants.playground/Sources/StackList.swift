import Foundation

public struct StackList<T> {
    
    fileprivate var head: Node<T>? = nil
    
    private var _count: Int = 0
    
    public init() {}
    
    public init<S : Sequence>(_ s: S) where S.Iterator.Element == T {
        for el in s {
            push(element: el)
        }
    }
    
    public mutating func push(element: T) {
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
}

// MARK: - CustomStringConvertible, CustomDebugStringConvertible
extension StackList: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        var d = "["
        var lastNode = head
        while lastNode != nil {
            d = d + "\(lastNode?.data)"
            lastNode = lastNode?.next
            if lastNode != nil {
                d = d + ","
            }
        }
        d = d + "]"
        return d
    }
    
    public var debugDescription: String {
        var d = "["
        var lastNode = head
        while lastNode != nil {
            d = d + "\(lastNode?.data)"
            lastNode = lastNode?.next
            if lastNode != nil {
                d = d + ","
            }
        }
        d = d + "]"
        return d
    }
}

public struct NodeIterator<T>: IteratorProtocol {
    
    public typealias Element = T
    
    private var head: Node<Element>?
    
    fileprivate init(head: Node<T>?){
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

extension StackList: Sequence {
    public typealias Iterator = NodeIterator<T>
    
    /// Returns an iterator over the elements of this sequence.
    public func makeIterator() -> NodeIterator<T> {
        return NodeIterator<T>(head: head)
    }
}

extension StackList: ExpressibleByArrayLiteral {
    
    // MARK: ExpressibleByArrayLiteral protocol conformance
    
    /// Constructs a circular buffer using an array literal.
    public init(arrayLiteral elements: T...) {
        for el in elements {
            push(element: el)
        }
    }
}


private class Node<T> {
    fileprivate var next: Node<T>?
    
    fileprivate var data: T
    
    init(data: T) {
        next = nil
        self.data = data
    }
}
