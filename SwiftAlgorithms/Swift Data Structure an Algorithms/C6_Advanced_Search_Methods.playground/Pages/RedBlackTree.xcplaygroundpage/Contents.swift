import Foundation

let rootNode = RedBlackTreeNode.init(value: 10)

//: Insert nodes in the proper place
rootNode.insertNodeFromRoot(value: 12)
rootNode.insertNodeFromRoot(value: 5)
rootNode.insertNodeFromRoot(value: 3)
rootNode.insertNodeFromRoot(value: 8)
rootNode.insertNodeFromRoot(value: 30)
rootNode.insertNodeFromRoot(value: 11)
rootNode.insertNodeFromRoot(value: 32)
rootNode.insertNodeFromRoot(value: 4)
rootNode.insertNodeFromRoot(value: 2)

//: Print the tree
RedBlackTreeNode.printTree(nodes: [rootNode])
