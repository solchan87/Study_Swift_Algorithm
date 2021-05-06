import Foundation

struct Person {
  var firstName: String
  var lastName: String
  init(firstName: String, lastName: String){
    self.firstName = firstName
    self.lastName = lastName
  }
}

class Address {
  var street: String = ""
  var city: String = ""
  var state: String = ""
  var zipcode: String = ""
  init(street: String, city: String, state: String, zipcode: String){
    self.street = street
    self.city = city
    self.state = state
    self.zipcode = zipcode
  }
}

let person = Person(firstName: "John:", lastName: "Smith")

let address = Address(street: "1 Infinite Loop", city: "Cupertino", state: "CA", zipcode: "95014")

address.city = "19111 Pruneridge Avenue"
