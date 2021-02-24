###   이진 트리 (Binary Tree)

***

> 모든 노드의 자식 노드가 두 개 이하인 트리 자료구조 

#### 1. 개요

- 정의 : 노드의 최대 Branch가 2인 트리 (자식0, 자식1, 자식2)

  - 노드가 <u>왼쪽 자식(left child)</u>과 <u>오른쪽 자식(right child)</u>만을 갖는 트리

  


<img src = "image\05\04.png" width = "600">

<br>

### 2. Binary Tree with Code

- 트리 기본 구조

  ```swift
  // indirect : recursive enum(node)이라 크기가 정해져 있지 않아서 선언해줌
  enum BinaryTree<T> {
      case empty
      // left child, value, and the right child
      indirect case node(BinaryTree, T, BinaryTree) 
      // Getting The Count
      var count: Int {
          switch self {
          case let .node(left, _, right):
              return left.count + 1 + right.count
          case .empty:
              return 0
          }
      }
  }
  
  class Node<T> {
      var value: T
      var leftChild: Node?
      var rightChild: Node?
      
      init(value: T) {
          self.value = value
      }
  }
  
  extension BinaryTree: CustomStringConvertible {
      var description: String {
          switch self {
          case let .node(left, value, right):
              return "value: \(value), left = [" + left.description + "], right = [" + right.description + "]"
          case .empty:
              return ""
          }
      }
  }
  ```

  

- 아래의 트리 구조 구현

  <img src = "image\05\07.png" width = "600">

- 아래에서부터 입력

  ```swift
  // leaf nodes
  let node5 = BinaryTree.node(.empty, "5", .empty)
  let nodeA = BinaryTree.node(.empty, "a", .empty)
  let node10 = BinaryTree.node(.empty, "10", .empty)
  let node4 = BinaryTree.node(.empty, "4", .empty)
  let node3 = BinaryTree.node(.empty, "3", .empty)
  let nodeB = BinaryTree.node(.empty, "b", .empty)
  
  // intermediate nodes on the left
  let Aminus10 = BinaryTree.node(nodeA, "-", node10)
  let timesLeft = BinaryTree.node(node5, "*", Aminus10)
  
  // intermediate nodes on the right
  let minus4 = BinaryTree.node(.empty, "-", node4)
  let divide3andB = BinaryTree.node(node3, "/", nodeB)
  let timesRight = BinaryTree.node(minus4, "*", divide3andB)
  
  // root node
  let tree = BinaryTree.node(timesLeft, "+", timesRight)
  
  ```

- 검색

  ```swift
  print(tree)
  // value: +, 
      left = [value: *, 
          left = [value: 5, left = [], right = []], 
          right = [value: -, 
              left = [value: a, left = [], right = []], 
              right = [value: 10, left = [], right = []]]], 
      right = [value: *, 
          left = [value: -, 
              left = [], 
              right = [value: 4, left = [], right = []]], 
          right = [value: /, 
              left = [value: 3, left = [], right = []], 
              right = [value: b, left = [], right = []]]]
  
  print(tree.count)
  // 12
  ```

  

- 이진 트리 순회 종류

  - 중위 순회(In-order traversal) : 왼쪽 자식 -> 루트 -> 오른쪽 자식
  - 전위 순회(Pre-order traversal) : 루트 -> 왼쪽 자식 -> 오른쪽 자식
  - 후위 순회(Post-order traversal) : 왼쪽 자식 -> 오른쪽 자식 -> 루트

  ```swift
  public func traverseInOrder(process: (T) -> Void) {
      if case let .node(left, value, right) = self {
        left.traverseInOrder(process: process)
        process(value)
        right.traverseInOrder(process: process)
      }
    }
    
    public func traversePreOrder(process: (T) -> Void) {
      if case let .node(left, value, right) = self {
        process(value)
        left.traversePreOrder(process: process)
        right.traversePreOrder(process: process)
      }
    }
    
    public func traversePostOrder(process: (T) -> Void) {
      if case let .node(left, value, right) = self {
        left.traversePostOrder(process: process)
        right.traversePostOrder(process: process)
        process(value)
      }
    }
  ```

  <img src = "\image\05\05.png">

  

---

- https://www.raywenderlich.com/990-swift-algorithm-club-swift-binary-search-tree-data-structure