import Foundation

var q1: Queue<Int> = [1,2,3,4,5]

var q2 = Queue<Int>(q1)

q1.dequeue()

q1

q2.enqueue(element: 55)

for el in q1 {
    print(el)
}
