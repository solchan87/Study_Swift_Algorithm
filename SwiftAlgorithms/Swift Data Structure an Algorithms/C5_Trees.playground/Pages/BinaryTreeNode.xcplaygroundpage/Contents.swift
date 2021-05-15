import Foundation

let rootNode = BinaryTreeNode(value: 10)
rootNode.insertNodeFromRoot(value: 20)
rootNode.insertNodeFromRoot(value: 5)
rootNode.insertNodeFromRoot(value: 21)
rootNode.insertNodeFromRoot(value: 8)
rootNode.insertNodeFromRoot(value: 4)

print("In-Order")
BinaryTreeNode.traverseInOrder(node:rootNode)

print("Pre-Order")
BinaryTreeNode.traversePreOrder(node:rootNode)

print("Post-Order")
BinaryTreeNode.traversePostOrder(node:rootNode)

print("Search result nil: " + "\(rootNode.search(value: 1)?.value)")
print("Search result found: " + "\(rootNode.search(value: 4)?.value)")

print("Deletion")
rootNode.leftChild?.delete()
rootNode.rightChild?.delete()
BinaryTreeNode.traverseInOrder(node:rootNode)
