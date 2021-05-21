import Foundation

var avlRootNode = AVLTreeNode.init(value: 100)
avlRootNode.insertNodeFromRoot(value: 50)
avlRootNode.insertNodeFromRoot(value: 200)
avlRootNode.insertNodeFromRoot(value: 150)
avlRootNode.insertNodeFromRoot(value: 125)
avlRootNode.insertNodeFromRoot(value: 250)

avlRootNode.balanceFactor = 2
avlRootNode.rightChild?.balanceFactor = -1
avlRootNode.rightChild?.rightChild?.balanceFactor = 0
avlRootNode.rightChild?.leftChild?.balanceFactor = -1
avlRootNode.rightChild?.leftChild?.leftChild?.balanceFactor = 0
avlRootNode.leftChild?.balanceFactor = 0

print("Invalid AVL tree")
AVLTreeNode.printTree(nodes: [avlRootNode])

if let newRoot = avlRootNode.rightChild?.leftChild?.rotateRightLeft() {
    avlRootNode = newRoot
}

print("Valid AVL tree")
AVLTreeNode.printTree(nodes: [avlRootNode])
