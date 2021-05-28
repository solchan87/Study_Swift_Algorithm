import Foundation

let nodeA = BFSNode(value: "A", neighbours: [], visited: false)
let nodeB = BFSNode(value: "B", neighbours: [], visited: false)
let nodeC = BFSNode(value: "C", neighbours: [], visited: false)
let nodeD = BFSNode(value: "D", neighbours: [], visited: false)
let nodeE = BFSNode(value: "E", neighbours: [], visited: false)
let nodeF = BFSNode(value: "F", neighbours: [], visited: false)

nodeA.addNeighbour(node: nodeB)
nodeC.addNeighbour(node: nodeB)
nodeD.addNeighbour(node: nodeB)
nodeE.addNeighbour(node: nodeB)
nodeF.addNeighbour(node: nodeD)

BFSNode.breadthFirstSearch(first: nodeA)
