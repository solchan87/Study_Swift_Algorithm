import Foundation

var settings = Set<String>()

var stringSet: Set = ["Erik", "Mary", "Michael", "John", "Sally"]
print(stringSet.debugDescription)

stringSet.insert("Patrick")

if stringSet.contains("Erik") {
  print("Found element")
}
else {
  print("Element not found")
}

stringSet.remove("Erik")

if let idx = stringSet.index(of: "John") {
  stringSet.remove(at: idx)
}

stringSet.removeFirst()

stringSet.removeAll()

stringSet = Set(["Erik", "Mary", "Michael", "John", "Sally"])
for name in stringSet {
  print("name = \(name)")
}

for name in stringSet.sorted() {
  print("name = \(name)")
}

let adminRole: Set = [ "READ", "EDIT", "DELETE", "CREATE", "SETTINGS", "PUBLISH_ANY", "ADD_USER", "EDIT_USER", "DELETE_USER"]

let editorRole: Set = ["READ", "EDIT", "DELETE", "CREATE", "PUBLISH_ANY"]

let authorRole: Set = ["READ", "EDIT_OWN", "DELETE_OWN", "PUBLISH_OWN", "CREATE"]

let contributorRole: Set = [ "CREATE", "EDIT_OWN"]

let subscriberRole: Set = ["READ"]

let fooResource = subscriberRole.union(contributorRole)

let commonPermissions = authorRole.intersection(contributorRole)

let exclusivePermissions = authorRole.symmetricDifference(contributorRole)

var sourceSet: Set = [1, 2, 3]
var destSet: Set = [2, 1, 3]

var isequal = sourceSet == destSet

let contactResource = authorRole
let userBob = subscriberRole
let userSally = authorRole

if userBob.isSuperset(of: fooResource){
  print("Access granted")
}
else {
  print("Access denied")
}

if userSally.isSuperset(of: fooResource){
  print("Access granted")
}
else {
  print("Access denied")
}

authorRole.isDisjoint(with: editorRole)

editorRole.isSubset(of: adminRole)
