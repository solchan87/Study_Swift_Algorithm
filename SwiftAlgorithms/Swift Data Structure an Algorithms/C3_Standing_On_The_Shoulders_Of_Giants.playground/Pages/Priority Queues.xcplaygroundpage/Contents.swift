import Foundation

var pq = PriorityQueue<Int>(ascending: true)

pq.push(5)
pq.push(3)
pq.push(10)


for el in pq {
    print(el)
}

var priorityQueue = PriorityQueue<String>(ascending: true, startingValues: ["Coldplay", "OneRepublic", "Maroon 5", "Imagine Dragons", "The Script"])



for el in priorityQueue {
    print(el)
}

var el = priorityQueue.pop()


for x in priorityQueue {
    print(x)
}
