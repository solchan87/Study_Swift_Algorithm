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

let redBlackTree = RedBlackTree<Double>()


redBlackTree.insert(key: 10)
redBlackTree.insert(key: 12)
redBlackTree.insert(key: 5)
redBlackTree.insert(key: 3)
redBlackTree.insert(key: 8)
redBlackTree.insert(key: 30)
redBlackTree.insert(key: 11)
redBlackTree.insert(key: 32)
redBlackTree.insert(key: 4)
redBlackTree.insert(key: 2)


redBlackTree.verify()
