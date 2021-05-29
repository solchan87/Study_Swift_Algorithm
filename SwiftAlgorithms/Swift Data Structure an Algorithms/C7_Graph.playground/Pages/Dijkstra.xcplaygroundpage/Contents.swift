import Foundation

let nodeA = DijkstraNode(value: "A", edges: [], visited: false)
let nodeB = DijkstraNode(value: "B", edges: [], visited: false)
let nodeC = DijkstraNode(value: "C", edges: [], visited: false)
let nodeD = DijkstraNode(value: "D", edges: [], visited: false)
let nodeE = DijkstraNode(value: "E", edges: [], visited: false)

let edgeAB = DijkstraEdge(weight: 3, from: nodeA, to: nodeB)
let edgeBA = DijkstraEdge(weight: 3, from: nodeB, to: nodeA)
let edgeAC = DijkstraEdge(weight: 1, from: nodeA, to: nodeC)
let edgeCA = DijkstraEdge(weight: 1, from: nodeC, to: nodeA)
let edgeBC = DijkstraEdge(weight: 1, from: nodeB, to: nodeC)
let edgeCB = DijkstraEdge(weight: 1, from: nodeC, to: nodeB)
let edgeBD = DijkstraEdge(weight: 2, from: nodeB, to: nodeD)
let edgeDB = DijkstraEdge(weight: 2, from: nodeD, to: nodeB)
let edgeDE = DijkstraEdge(weight: 1, from: nodeD, to: nodeE)
let edgeED = DijkstraEdge(weight: 1, from: nodeE, to: nodeD)
let edgeCE = DijkstraEdge(weight: 8, from: nodeC, to: nodeE)
let edgeEC = DijkstraEdge(weight: 8, from: nodeE, to: nodeC)

let graph = DijkstraGraph(nodes: [nodeA,nodeB,nodeC,nodeD,nodeE])

DijkstraGraph.dijkstraPath(startNode: nodeA, graph: graph, finishNode: nodeE)
