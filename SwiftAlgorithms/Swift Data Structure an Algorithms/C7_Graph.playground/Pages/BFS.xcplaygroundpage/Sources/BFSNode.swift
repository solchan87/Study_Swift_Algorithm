import Foundation

public class BFSNode<T> {

    public var value:T
    public var neighbours:[BFSNode]
    public var visited:Bool
    
    public init(value:T, neighbours:[BFSNode], visited:Bool) {
        self.value = value
        self.neighbours = neighbours
        self.visited = visited
    }
    
    public func addNeighbour(node: BFSNode) {
        self.neighbours.append(node)
        node.neighbours.append(self)
    }
    
    public static func breadthFirstSearch(first:BFSNode) {
        var queue:[BFSNode] = []
        
        queue.append(first)
        
        while queue.isEmpty == false {
            if let node = queue.first {
                print(node.value)
                node.visited = true
                for neighbour in node.neighbours {
                    if neighbour.visited == false {
                        queue.append(neighbour)
                    }
                }
                queue.removeFirst()
            }
        }
    }
    
}
