import Foundation

public struct ArrayStack<T> {
    
    fileprivate var elements = [T]()
    
    public init() {}
    
    public init<S : Sequence>(_ s: S) where S.Iterator.Element == T {
        self.elements = Array(s.reversed())
    }
    
    mutating public func pop() -> T? {
        return self.elements.popLast()
    }
    
    mutating public func push(element: T){
        self.elements.append(element)
    }
    
    public func peek() -> T? {
        return self.elements.last
    }
    
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    public var count: Int {
        return self.elements.count
    }
    
}

extension ArrayStack: ExpressibleByArrayLiteral {
    
    public init(arrayLiteral elements: T...) {
        self.init(elements)
    }
}

extension ArrayStack: CustomStringConvertible, CustomDebugStringConvertible {
    
    public var description: String {
        return self.elements.description
    }
    
    public var debugDescription: String {
        return self.elements.debugDescription
    }
    
}

var myStack = ArrayStack<Int>()

myStack.push(element: 5)
myStack.push(element: 44)
myStack.push(element: 23)

print(myStack)

var x = myStack.pop()
x = myStack.pop()
x = myStack.pop()
x = myStack.pop()
x = myStack.pop()

print(myStack)

myStack.push(element: 87)
myStack.push(element: 2)
myStack.push(element: 9)

print(myStack)


myStack = [4,5,6,7]

type(of: myStack)


extension ArrayStack: Sequence {
    
    public func makeIterator() -> AnyIterator<T> {
        return AnyIterator(IndexingIterator(_elements: self.elements.lazy.reversed()))
    }
}

var myStackFromStack = ArrayStack<Int>(myStack)

myStackFromStack.push(element: 55)

myStack.push(element: 70)
myStack.push(element: 10)

for el in myStack {
    print(el)
}
