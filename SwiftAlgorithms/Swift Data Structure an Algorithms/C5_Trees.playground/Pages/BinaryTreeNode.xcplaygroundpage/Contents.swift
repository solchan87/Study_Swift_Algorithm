import Foundation

let rootNode = BinaryTreeNode(value: 10)
rootNode.insertNodeFromRoot(value: 20)
rootNode.insertNodeFromRoot(value: 5)
rootNode.insertNodeFromRoot(value: 21)
rootNode.insertNodeFromRoot(value: 8)
rootNode.insertNodeFromRoot(value: 4)
/*
 트리 구조
       10
    5      20
 4    8       21
 */

// 좌측 값 > 루트 노드 값 > 우측 값
print("In-Order")
BinaryTreeNode.traverseInOrder(node:rootNode)

// 루트 노드 값 > 좌측 서브트리 > 우측 서브 트리
print("Pre-Order")
BinaryTreeNode.traversePreOrder(node:rootNode)

// 좌측 서브트리 > 우측 서브트리 > 루트 노드
print("Post-Order")
BinaryTreeNode.traversePostOrder(node:rootNode)

print("Search result nil: " + "\(rootNode.search(value: 1)?.value)")
// 결과: 값이 없음
print("Search result found: " + "\(rootNode.search(value: 4)?.value)")
// 결과: Optional(4)

print("Deletion")
rootNode.delete()
//rootNode.rightChild?.delete()
BinaryTreeNode.traverseInOrder(node:rootNode)

let bTree = BTree<Int, Int>(order: 1)!

bTree.insert(1, for: 1)
bTree.insert(2, for: 2)
bTree.insert(3, for: 3)
bTree.insert(4, for: 4)

bTree.value(for: 3)
bTree[3]

bTree.remove(2)

bTree.traverseKeysInOrder { key in
    print(key)
}

bTree.numberOfKeys

bTree.order

bTree.inorderArrayFromKeys
