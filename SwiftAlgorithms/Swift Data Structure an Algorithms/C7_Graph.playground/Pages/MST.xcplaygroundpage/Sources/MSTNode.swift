import Foundation

public class MSTNode<T:Hashable> {
    
    public var value:T
    public var edges:[MSTEdge<T>]
    public var visited:Bool
    
    public init(value:T, edges:[MSTEdge<T>], visited:Bool) {
        self.value = value
        self.edges = edges
        self.visited = visited
    }
}
