import Foundation

var sl = StackList<Int>()

sl.push(element: 34)
sl.push(element: 77)
sl.push(element: 67)

let x = sl.pop()

let y = sl.pop()


for el in sl {
    print(el)
}

sl.push(element: 16)
sl.push(element: 18)
sl.push(element: 20)

for el in sl {
    print(el)
}
