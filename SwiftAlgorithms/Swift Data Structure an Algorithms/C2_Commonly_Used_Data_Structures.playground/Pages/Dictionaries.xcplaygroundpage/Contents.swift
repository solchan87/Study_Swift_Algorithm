import Foundation

var myDict = Dictionary<Int, String>()

myDict = [Int: String]()

var myLiteralDict: [Int: String] = [1: "One", 2: "Two", 3: "Three"]

myLiteralDict = [1: "One", 2: "Two", 3: "Three"]

myDict = [1: "One", 2: "Two", 3: "Three"]
myDict.updateValue("Four", forKey: 4)

myDict[5] = "Five"

let removdPair = myDict.removeValue(forKey: 1)

myDict[2] = nil

myDict = [1: "One", 2: "Two", 3: "Three"]
if let optResult = myDict[3] {
    print(optResult)
}
else {
    print("Key not found")
}

let result = myDict[3]

let states = [ "AL" : "Alabama", "CA" : "California", "AK" : "Alaska", "AZ" : "Arizona", "AR" : "Arkansas"]

for (stateAbbr, stateName) in states {
    print("The state abbreviation for \(stateName) is \(stateAbbr)")
}

for (stateAbbr) in states.keys {
    print("State abbreviation: \(stateAbbr)")
}

for (stateName) in states.values {
    print("State name: \(stateName)")
}

let sortedArrayFromDictionary = states.sorted(by: { $0.0 < $1.0 })

for (key) in sortedArrayFromDictionary.map({ $0.0}) {
    print("The key: \(key)")
}

for (value) in sortedArrayFromDictionary.map({ $0.1}) {
    print("The value: \(value)")
}
