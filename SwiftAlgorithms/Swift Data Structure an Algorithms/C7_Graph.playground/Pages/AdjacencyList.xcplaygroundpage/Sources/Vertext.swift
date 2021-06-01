// MARK: 꼭지점
// Equatable 프로토콜에 준수하는 Vertext구조체 정의
public struct Vertex<T:Hashable> {
    public var data:T
    public let index:Int
}

// Vertex 구조체 비교 함수
public func == <T: Hashable> (lhs: Vertex<T>, rhs: Vertex<T>) -> Bool {
    guard lhs.data == rhs.data else {
        return false
    }
    return true
}
