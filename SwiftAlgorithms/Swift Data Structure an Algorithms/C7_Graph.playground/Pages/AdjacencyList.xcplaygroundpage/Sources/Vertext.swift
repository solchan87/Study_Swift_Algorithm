public struct Vertex<T:Equatable & Hashable>:Equatable {
    public var data:T
    public let index:Int
}

public func == <T: Equatable> (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    guard lhs.data == rhs.data else {
        return false
    }
    return true
}
