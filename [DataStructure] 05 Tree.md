### 트리 (Tree)

***

>비선형 자료구조로 데이터 사이의 계층적 관계(Hierarchical Relationship)를 표현

#### 1. 트리 구조

- 정의 : Node와 Branch를 이용해서, 사이클을 이루지 않도록 구성한 데이터 구조

- 적용 : 트리 중 이진 트리 (Binary Tree) 형태의 구조로, 탐색(검색) 알고리즘 구현을 위해 많이 사용됨

- 용어

  - Node (노드) : 트리에서 데이터를 저장하는 기본 요소 
  - Edge (간선) : 트리를 구성하기 위해 노드와 노드를 연결하는 선
  - Root Node: 트리 맨 위에 있는 노드로 부모 노드가 없는 노드
  - Leaf Node / Terminal Node (단말노드) : Child Node가 하나도 없는 노드
  - Parent Node: 어떤 노드의 다음 레벨에 연결된 노드
  - Child Node: 어떤 노드의 상위 레벨에 연결된 노드
  - Level: 최상위 노드를 Level 0으로 하였을 때, 하위 Branch로 연결된 노드의 깊이를 나타냄
  - Sibling (Brother Node): 동일한 Parent Node를 가진 노드
- Depth: 트리에서 Node가 가질 수 있는 최대 Level
  
  <img src = "image\05\01.png">



## TreeNode with Code

- 기본 트리 구조

  ```swift
  public class TreeNode<T> {
    
      public var value: T
      public weak var parent: TreeNode? // weak to avoid retain cycles.
      public var children: [TreeNode] = []
  
      public init(_ value: T) {
          self.value = value
      }
  
      public func addChild(_ child: TreeNode) {
          children.append(child)
          child.parent = self
      }
  }
  // 값 출력을 위한 method
  extension TreeNode: CustomStringConvertible {
      public var description: String {
          var s = "\(value)"
          if !children.isEmpty {
              s += " {" + children.map{ $0.description }.joined(separator: ", ") + "}"
          }
          return s
      }
  }
  
  extension TreeNode where T: Equatable {
      func search(_ value: T) -> TreeNode? {
      if value == self.value {
          return self
      }
      for child in children {
          if let found = child.search(value) {
              return found
          }
      }
      return nil
      }
  }
  ```

  

- 다음 구조를 트리로 구현

  <img src = "image\05\02.png">

  ```swift
  let tree = TreeNode("beverages")
  
  let hotNode = TreeNode("hot")
  let coldNode = TreeNode("cold")
  
  let teaNode = TreeNode("tea")
  let coffeeNode = TreeNode("coffee")
  let chocolateNode = TreeNode("cocoa")
  
  let blackTeaNode = TreeNode("black")
  let greenTeaNode = TreeNode("green")
  let chaiTeaNode = TreeNode("chai")
  
  let sodaNode = TreeNode("soda")
  let milkNode = TreeNode("milk")
  
  let gingerAleNode = TreeNode("ginger ale")
  let bitterLemonNode = TreeNode("bitter lemon")
  
  tree.addChild(hotNode)
  tree.addChild(coldNode)
  
  hotNode.addChild(teaNode)
  hotNode.addChild(coffeeNode)
  hotNode.addChild(chocolateNode)
  
  coldNode.addChild(sodaNode)
  coldNode.addChild(milkNode)
  
  teaNode.addChild(blackTeaNode)
  teaNode.addChild(greenTeaNode)
  teaNode.addChild(chaiTeaNode)
  
  sodaNode.addChild(gingerAleNode)
  sodaNode.addChild(bitterLemonNode)
  ```

- 트리구조 출력

  ```swift
  print(tree)
  // beverages {hot {tea {black, green, chai}, coffee, cocoa}, cold {soda {ginger ale, bitter lemon}, milk}}
  
  print(teaNode.parent!)
  // hot {tea {black, green, chai}, coffee, cocoa} paretnt
  
  let searchResult = tree.search("tea")?.children[0]
  print(searchResult!)
  // black
  ```

  

---

- https://github.com/raywenderlich/swift-algorithm-club/tree/master/Tree

