import Foundation

public class MSTEdge<T:Equatable & Hashable>:Equatable {
    public var from:MSTNode<T>
    public var to:MSTNode<T>
    public var weight:Double
    
    public init(weight:Double, from:MSTNode<T>, to:MSTNode<T>) {
        self.weight = weight
        self.from = from
        self.to = to
        
        from.edges.append(self)
    }
}

public func == <T: Equatable> (lhs: MSTEdge<T>, rhs: MSTEdge<T>) -> Bool {
    guard lhs.from.value == rhs.from.value else {
        return false
    }
    guard lhs.to.value == rhs.to.value else {
        return false
    }
    return true
}

extension MSTEdge: Hashable {
    public var hashValue: Int {
        get {
            let stringHash = "\(from.value)->\(to.value)"
            return stringHash.hashValue
        }
    }
}
