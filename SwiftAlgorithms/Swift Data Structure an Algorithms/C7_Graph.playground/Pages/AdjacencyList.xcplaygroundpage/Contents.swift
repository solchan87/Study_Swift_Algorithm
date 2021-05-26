import Foundation

var adjacencyList:AdjacencyListGraph<String> = AdjacencyListGraph<String>()

let vertexA = adjacencyList.addVertex(data: "A")
let vertexB = adjacencyList.addVertex(data: "B")
let vertexC = adjacencyList.addVertex(data: "C")
let vertexD = adjacencyList.addVertex(data: "D")

let edgeAB = adjacencyList.addEdge(from: vertexA, to: vertexB)
let edgeBC = adjacencyList.addEdge(from: vertexB, to: vertexC)
let edgeCD = adjacencyList.addEdge(from: vertexC, to: vertexD)

print(adjacencyList)
