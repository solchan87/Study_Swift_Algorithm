// MARK: 모서리
// Equatable 프로토콜에 준수하는 Edge구조체 정의
public struct Edge<T:Hashable> {
    public let from:Vertex<T>
    public let to:Vertex<T>
}

extension Edge: Hashable {
    public var hashValue: Int {
        get {
            let stringHash = "\(from.index)->\(to.index)"
            return stringHash.hashValue
        }
    }
}

// Edge 구조체 비교 함수
public func == <T: Hashable> (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    guard lhs.from == rhs.from else {
        return false
    }
    guard lhs.to == rhs.to else {
        return false
    }
    return true
}
