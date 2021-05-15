public class BinaryTreeNode<T:Comparable> {
    
    public var value:T
    public var leftChild:BinaryTreeNode?
    public var rightChild:BinaryTreeNode?
    public weak var parent:BinaryTreeNode?
    
    public convenience init(value: T) {
        self.init(value: value, left: nil, right: nil, parent:nil)
    }
    
    public init(value:T, left:BinaryTreeNode?, right:BinaryTreeNode?, parent:BinaryTreeNode?) {
        self.value = value
        self.leftChild = left
        self.rightChild = right
        self.parent = parent
    }
    
    public func insertNodeFromRoot(value:T) {
        if let _ = self.parent {
            print("You can only add new nodes from the root node of the tree");
            return
        }
        self.addNode(value: value)
    }

    private func addNode(value:T) {
        if value < self.value {
            if let leftChild = leftChild {
                leftChild.addNode(value: value)
            }else {
                let newNode = BinaryTreeNode(value: value)
                newNode.parent = self
                leftChild = newNode
            }
        }else {
            if let rightChild = rightChild {
                rightChild.addNode(value: value)
            }else {
                let newNode = BinaryTreeNode(value: value)
                newNode.parent = self
                rightChild = newNode
            }
        }
    }
    
    public class func traverseInOrder(node:BinaryTreeNode?) {
        
        guard let node = node else {
            return
        }
        
        BinaryTreeNode.traverseInOrder(node: node.leftChild)
        print(node.value)
        BinaryTreeNode.traverseInOrder(node: node.rightChild)
    }

    public class func traversePreOrder(node:BinaryTreeNode?) {
        
        guard let node = node else {
            return
        }
        
        print(node.value)
        BinaryTreeNode.traversePreOrder(node: node.leftChild)
        BinaryTreeNode.traversePreOrder(node: node.rightChild)
    }

    public class func traversePostOrder(node:BinaryTreeNode?) {
        
        guard let node = node else {
            return
        }
        
        BinaryTreeNode.traversePostOrder(node: node.leftChild)
        BinaryTreeNode.traversePostOrder(node: node.rightChild)
        print(node.value)
    }

    public func search(value:T) -> BinaryTreeNode? {
      
        if value == self.value {
            return self
        }
        
        if value < self.value {
            guard let left = leftChild else {
                return nil
            }
            return left.search(value: value)
        }else {
            guard let right = rightChild else {
                return nil
            }
            return right.search(value: value)
        }
    }

    public func delete() {
        if let left = leftChild {
            if let _ = rightChild {
                self.exchangeWithSuccessor()
            }else {
                self.connectParentTo(child: left)
            }
        }else if let right = rightChild {
            self.connectParentTo(child: right)
        }else {
            self.connectParentTo(child: nil)
        }
        
        self.parent = nil
        self.leftChild = nil
        self.rightChild = nil
    }
    
    private func exchangeWithSuccessor() {
        guard let right = self.rightChild , let left = self.leftChild else {
            return
        }
        let successor = right.minimum()
        successor.delete()
        
        successor.leftChild = left
        left.parent = successor
        
        if right !== successor {
            successor.rightChild = right
            right.parent = successor
        } else {
            successor.rightChild = nil
        }
        
        self.connectParentTo(child: successor)
    }
    
    private func connectParentTo(child:BinaryTreeNode?) {
        guard let parent = self.parent else {
            child?.parent = self.parent
            return
        }
        if parent.leftChild === self {
            parent.leftChild = child
            child?.parent = parent
        }else if parent.rightChild === self {
            parent.rightChild = child
            child?.parent = parent
        }
    }
    
    public func minimumValue() -> T {
        if let left = leftChild {
            return left.minimumValue()
        }else {
            return value
        }
    }
    
    public func maximumValue() -> T {
        if let right = rightChild {
            return right.maximumValue()
        }else {
            return value
        }
    }
    
    public func minimum() -> BinaryTreeNode {
        if let left = leftChild {
            return left.minimum()
        }else {
            return self
        }
    }
    
    public func maximum() -> BinaryTreeNode {
        if let right = rightChild {
            return right.maximum()
        }else {
            return self
        }
    }
    
    public func height() -> Int {
        if leftChild == nil && rightChild == nil {
            return 0
        }
        
        return 1 + max(leftChild?.height() ?? 0, rightChild?.height() ?? 0)
    }
    
    public func depth() -> Int {
        guard var node = parent else {
            return 0
        }
        
        var depth = 1
        while let parent = node.parent {
            depth = depth + 1
            node = parent
        }
        
        return depth
    }

}
