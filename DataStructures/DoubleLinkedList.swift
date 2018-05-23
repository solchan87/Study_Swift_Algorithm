public class Node<T> {

  var value: T
  var next: Node<T>?
  weak var previous: Node<T>?

  init(value: T) {
    self.value = value
  }
}
