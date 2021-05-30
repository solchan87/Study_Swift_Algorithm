import Foundation

let nodeA = MSTNode(value: "A", edges: [], visited: false)
let nodeB = MSTNode(value: "B", edges: [], visited: false)
let nodeC = MSTNode(value: "C", edges: [], visited: false)
let nodeD = MSTNode(value: "D", edges: [], visited: false)

let edgeAB = MSTEdge(weight: 3, from: nodeA, to: nodeB)
let edgeBA = MSTEdge(weight: 3, from: nodeB, to: nodeA)
let edgeAC = MSTEdge(weight: 1, from: nodeA, to: nodeC)
let edgeCA = MSTEdge(weight: 1, from: nodeC, to: nodeA)
let edgeBC = MSTEdge(weight: 100, from: nodeB, to: nodeC)
let edgeCB = MSTEdge(weight: 100, from: nodeC, to: nodeB)
let edgeBD = MSTEdge(weight: 2, from: nodeB, to: nodeD)
let edgeDB = MSTEdge(weight: 2, from: nodeD, to: nodeB)

let graph = MSTGraph(nodes: [nodeA,nodeB,nodeC,nodeD])

MSTGraph.minimumSpanningTree(startNode: nodeA, graph: graph)
