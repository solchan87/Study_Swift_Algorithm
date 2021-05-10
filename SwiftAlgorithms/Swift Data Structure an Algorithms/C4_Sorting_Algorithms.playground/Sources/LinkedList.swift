import Foundation

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

extension LinkedList: CustomStringConvertible, CustomDebugStringConvertible {
    
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
    
    convenience init() {
        self.init()
    }
    
    init(data: T) {
        next = nil
        self.data = data
    }

}
