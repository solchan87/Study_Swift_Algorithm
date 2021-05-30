import Foundation

public class MSTGraph<T:Hashable & Equatable> {
    public var nodes:[MSTNode<T>]
    
    public init(nodes:[MSTNode<T>]) {
        self.nodes = nodes
    }
    
    public static func minimumSpanningTree(startNode:MSTNode<T>, graph:MSTGraph<T>) {
        
        var visitedNodes:[MSTNode<T>] = []
        
        print(startNode.value)
        visitedNodes.append(startNode)
        startNode.visited = true
        
        while visitedNodes.count < graph.nodes.count {
            
            var unvistedEdges:[MSTEdge<T>] = []
            _ = visitedNodes.map({ (node) -> () in
                let edges = node.edges.filter({ (edge) -> Bool in
                    edge.to.visited == false
                })
                unvistedEdges.append(contentsOf: edges)
            })
            
            if let minimumUnvisitedEdge = unvistedEdges.sorted(by: { (edgeA, edgeB) -> Bool in
                edgeA.weight < edgeB.weight}).first {
                print("\(minimumUnvisitedEdge.from.value) <--------> \(minimumUnvisitedEdge.to.value)")
                minimumUnvisitedEdge.to.visited = true
                visitedNodes.append(minimumUnvisitedEdge.to)
            }
        }
    }

}
