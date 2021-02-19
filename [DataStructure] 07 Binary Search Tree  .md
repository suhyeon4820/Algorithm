### 이진 탐색 트리 (Binary Search Tree)

#### 1. 이진 탐색 트리 (Binary Search Tree)

- 이진 탐색 트리 (Binary Search Tree, BST) : 이진 트리에 다음과 같은 추가적인 **조건**이 있는 트리

  1. 이진 탐색 트리의 노드에 저장된 키는 유일

  2. 부모의 키가 왼쪽 자식 노드의 키보다 큼

  3. 부모의 키가 오른쪽 자식 노드의 키보다 작음

  4. 왼쪽과 오른쪽 서브트리도 이진 탐색 트리

  - **왼쪽 노드**는 `부모 노드보다 작은 값`, **오른쪽 노드**는 `부모 노드보다 큰 값을 가지고 있음`

    - **왼쪽 자식 노드 < 부모 노드 < 오른쪽 자식 노드**

  - 시간복잡도 : **O(h)** -> h : 트리 높이(트리를 하나 더하면 노드의 수가 두 배씩 증가)

    

    <img src = "\image\05\06.png" width = "300">

    

    

### Insertion

When performing an insertion, starting with the root node as the current node:

- *If the current node is empty*, you insert the new node here.
- *If the new value is smaller*, you go down the left branch.
- *If the new value is greater*, you go down the right branch.



***

### 2. Code

```swift
enum BinaryTree<T: Comparable> {
    case empty
    indirect case node(BinaryTree, T, BinaryTree)
    
    mutating func naiveInsert(newValue: T) {
        // 2. guard statement to expose the left child, current value, and right child of the current node. If this node is empty, then guard will fail into it’s else block.
        guard case .node(var left, let value, var right) = self else {
            // 3.
            self = .node(.empty, newValue, .empty)
            return
        }
        // 4. TODO: Implement rest of algorithm!
        if newValue < value {
          left.naiveInsert(newValue: newValue)
        } else {
          right.naiveInsert(newValue: newValue)
        }
    }
    
    mutating func insert(newValue: T) {
      self = newTreeWithInsertedValue(newValue: newValue)
    }
    
    private func newTreeWithInsertedValue(newValue: T) -> BinaryTree {
      switch self {
      // 1
      case .empty:
        return .node(.empty, newValue, .empty)
      // 2
      case let .node(left, value, right):
        if newValue < value {
          return .node(left.newTreeWithInsertedValue(newValue: newValue), value, right)
        } else {
          return .node(left, value, right.newTreeWithInsertedValue(newValue: newValue))
        }
      }
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



---

- https://www.raywenderlich.com/990-swift-algorithm-club-swift-binary-search-tree-data-structure