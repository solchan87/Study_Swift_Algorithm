import Foundation

public class DijkstraGraph<T:Hashable & Equatable> {
    public var nodes:[DijkstraNode<T>]
    
    public init(nodes:[DijkstraNode<T>]) {
        self.nodes = nodes
    }
    
    public static func dijkstraPath(startNode:DijkstraNode<T>, graph:DijkstraGraph<T>, finishNode:DijkstraNode<T>) {
        var unvisitedNodes = Set<DijkstraNode<T>>(graph.nodes)
        
        startNode.distance = 0
        
        var currentNode:DijkstraNode<T> = startNode
        
        while (finishNode.visited == false) {
            for edge in currentNode.edges.filter({ (edge) -> Bool in
                return edge.to.visited == false
            }) {
                let temporaryDistance = currentNode.distance + Int(edge.weight)
                
                if edge.to.distance > temporaryDistance {
                    edge.to.distance = temporaryDistance
                    edge.to.previous = currentNode
                }
            }
            
            currentNode.visited = true
            
            unvisitedNodes.remove(currentNode)
            
            if let newCurrent = unvisitedNodes.sorted(by: { (nodeA, nodeB) -> Bool in
                nodeA.distance  < nodeB.distance
            }).first {
                currentNode = newCurrent
            }else {
                break
            }
        }
        DijkstraGraph.printShortestPath(node: finishNode)
    }
    
    public static func printShortestPath(node:DijkstraNode<T>) {
        if let previous = node.previous {
            DijkstraGraph.printShortestPath(node: previous)
        }else {
            print("Shortest path:")
        }
        print("->\(node.value)", terminator:"")
    }
}
