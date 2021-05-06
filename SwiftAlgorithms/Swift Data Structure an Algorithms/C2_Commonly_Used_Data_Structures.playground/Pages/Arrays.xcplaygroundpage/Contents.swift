import Foundation

var intArray = Array<Int>()

intArray = [Int]()

var intLiteralArray: [Int] = [1, 2, 3]

intLiteralArray = [1, 2, 3]

intLiteralArray = [Int](repeating: 2, count: 5)

intArray.capacity

intArray.reserveCapacity(500)

intArray.capacity

intArray.append(50)

intArray.append(contentsOf: [60, 65, 70, 75])

intArray.insert(55, at: 1)

intArray[2] = 63

intArray[5]

intArray[2..<5]

for element in intArray {
  print(element)
}

intArray.contains(55)
