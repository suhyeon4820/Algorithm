### 링크드 리스트 (Linked List)

***

>항목들을 링크를 통해 일렬로 나열할 수 있는 연결된 구조 (데이터에 순서를 매겨 늘어놓은 자료구조 )

#### 1. Linked List (연결리스트) 구조

- 링크드 리스트는 떨어진 곳에 존재하는 데이터를 화살표로 연결해서 관리하는 데이터 구조
- 링크드 리스트 기본 구조와 용어
  - **노드(Node)**: 각각의 원소, 데이터 저장 단위 (데이터값 + 포인터) 로 구성
  - **데이터(Data)** : 저장하고 싶은 데이터
  - **포인터(pointer)/링크** : 각 노드 안에서 다음이나 이전의 노드와의 연결 정보를 가지고 있는 공간
    - 다음 노드의 시작 메모리 주소를 뜻하는 링크 포함
    - 마지막 노드의 포인터(링크)는 nil

<img src = "image\03\01.png" width = "600">

- 장점
  - 각각의 원소들은 자기 자신 다음에 어떤 원소가 연결되었는지 알고 있음 -> 중간에 삭제, 삽입이 쉬움 **O(1)** 
  - 미리 데이터 공간을 미리 할당하지 않아도 됨
    - 배열은 **미리 데이터 공간을 할당** 해야 함
  - Tree 구조의 근간이 되는 자료구조
- 단점
  - 연결을 위한 별도 데이터 공간이 필요하므로, 저장공간 효율이 높지 않음
  - Array 와 달리 논리적 저장 순서와 물리적 저장 순서가 달라 원하는 위치의 정보를 찾는 시간이 필요해 접근 속도가 느림 -> **O(n)**
  - 중간 데이터 삭제시, 앞뒤 데이터의 연결을 재구성해야 하는 부가적인 작업 필요

|

#### 2. 삽입

- **장점** : 배열과 달리 링크드 리스트는 데이터를 하나도 시프트하지 않고 리스트 앞에 데이터를 삽입할 수 있는 유연성이 있음

  - 리스트 처음에 삽입 : 시간복잡도 -> O(1)

  - 리스트 중간에 삽입 : 시간복잡도 -> O(n) , 삽입할 위치의 인덱스 검색(n)

    | 시나리오    | 배열            | 연결리스트      |
    | ----------- | --------------- | --------------- |
    | 앞에 삽입   | 최악의 경우     | **최선의 경우** |
    | 중간에 삽입 | 평균적인 경유   | 평균적인 경우   |
    | 끝에 삽입   | **최선의 경우** | 최악의 경우     |

  1) 새로운 노드 `cur` 생성

  <img src = "image\03\02.png" width ="600">

  

  2) `cur`노드를 next 노드에 연결

  <img src = "image\03\03.png" width = "600">

  

  3)  next 노드와 연결된 `cur`노드를 prev 노드에 연결

  <img src = "image\03\04.png" width = "600">



---

## Doubly Linked List - code

- 하나의 노드가 이전 노드와 다음 노드를 모두 알고 있도록 설계

<img src = "image\03\05.png" width = "600">



### Step 1 — create a Node class

- 노드의 값 : **value**
- 다음 노드의 pointer :  **next**
- 이전 노드의 pointer :  **previous**
- <u>next, previous값이 옵셔널인 이유는 첫번째 노드의 previous와 마지막 노드의 next값이 nil이기 때문</u>

```swift
public class LinkedListNode<T> {
  
    var value: T
    var next: LinkedListNode?
    var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}
```

<br>

### Step 2 — create a LinkedList class

- Head : 첫 번째 노드

- isEmpty

```swift
public class LinkedList<T> {
   
    private var head: Node?
  
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node? {
        return head
    }
    
}
```

<br>

### Step 3 — provide a last Node

- We can get access to the last Node in our list by first checking if the head even has a value. By doing this, if the head is nil we can immediately communicate that there is indeed no last node given there isn’t even a head to begin with.

  If the head does have a value then we need to check it’s next node to see if it has a value and if it does, check it’s next value to see if it has a value and so on until there is no next value on the final node.next Node.

  When the while loop fails, we will know we have reached the end of our list and we can return the last node.

```swift
public var last: Node? {
    guard var node = head else { return nil }
  
    while let next = node.next {
        node = next
    }
    return node
}
```

<br>

### Step 4 — Appending Nodes

- 값(value)을 받을 수 있도록 newNode 생성
- 마지막 노드가 있는지 확인
- 마지막 노드가 있다면, previous는 마지막 노드가 되고 previous는 새로운 노드가 됨

```swift
public func append(value: T) {
    let newNode = Node(value: value)
    if let lastNode = last {
        /// at least one node exist
        newNode.previous = lastNode
        lastNode.next = newNode
    } else {
        /// no nodes in list
        head = newNode
    }
}
```

<br>

### Step 5 — fetch the number Nodes in a LinkedList // counting the nodes

- head가 값을 가지고 있는지 확인하고, 값이 없으면 0을 return
- if head does have a value then we automatically know there is at least one value, so when we declare count we start at 1
- use a while loop to traverse our LinkedList until there is no node.next just like we did to reach the end of our list when looking for the last node.
- When node.next no longer has a value we know we have reached the tail and we have our full list count, return the count.

```swift
public var count: Int {
    guard var node = head else { return 0 }
    var count = 1
    while let next = node.next {
        node = next
        count += 1
    }
    return count
}
```

<br>

### Step 6 — print each Node value from a LinkedList

- create a public variable called print.
- set the current node to our head node
- use a while loop to traverse our list. while node is not nil, it must have a value, add that value to our string
- once node.next has a value we know we have reached the tail of our list and we can proceed to return the string of nodes.

```swift
public var print: String {
    var stringArray = "["
    guard var node = head else { return "[]" }
    stringArray += "\(node.value)"
    
    while let next = node.next {
        node = next
        stringArray += "\(node.value)"
    }
    return stringArray + "]"
}
```

<br>

### Step 7 —fetch a Node from a specified index

- check if the index is 0, if it is, then just return the head.
- if index is not 0, then use a for loop to navigate through our nodes until we reach the index, then return that node if it is not nil.
- if all else fails, just return the node

```
public func node(atIndex index: Int) -> Node {
    if index == 0 {
        return head!
    } else {
        var node = head?.next
        for _ in 1..<index {
            node = node?.next
            if node == nil { break }
        }
        return node!
    }
}
```

<br>

### Step 8 — insert a Node at a specific index

- take the value we desire to insert, and create an instance of Node with it.
- if the index is 0, simply take the new node’s next node and set it as our head
- take the head and set it’s previous to our newNode
- make the head our newNode
- if the index is not 0, fetch the node one space before the insertion position and set previousNode equal to it.
- then grab it’s next Node with previousNode.next and set nextNode equal to it.
- take the newNode’s previous and set it equal to previousNode
- take the new Node’s next node and set it equal to previousNode’s next
- take the previousNode’s next node and assign it to the newNode
- take the nextNode’s previous node and assign it to the newNode

```swift
public func insert(value: T, atIndex index: Int) {
    let newNode = Node(value: value)
    if index == 0 {
        newNode.next = head
        head?.previous = newNode
        head = newNode
    } else {
        let prev = self.node(atIndex: index - 1)
        let next = prev.next
            
        newNode.previous = prev
        newNode.next = prev.next
            
        prev.next = newNode
        next?.previous = newNode
    }
}
```

<br>

### Step 9 — remove a Node at a specific index

- ake in a node to remove and set the previousNode to node’s previous
- do the same, respectively, with nextNode
- if the previous node exists, then take it’s next node and assign it to the node we are removing’s next node
- if the previousNode of the node we are removing does not exist, then set head equal to the next node as it is now the head since it’s previousNode was the head
- set the nextNode’s previous to the node we are removing’s previous node
- take the node we are removing and free all references to other nodes
- return the value to tell us which one we just removed

before we can use that function we need to fetch the node from the value we are providing since we can’t just create the node and pass it in

- take the index of the node we are trying to remove, and fetch the node at that index
- remove the node with method we just wrote

```swift
public func remove(node: Node) -> T {
  
    let prev = node.previous
    let next = node.next
  
    if let prev = prev {
        prev.next = next
    } else {
        head = next
    }
    next?.previous = prev
        
    node.previous = nil
    node.next = nil
    return node.value
}
    
public func removeAt(_ index: Int) -> T {
    let nodeToRemove = node(atIndex: index)
    return remove(node: nodeToRemove)
}
```



---

[ 출처 ]

- https://itnext.io/linkedlist-in-swift-code-a-linkedlist-data-structure-in-swift-playgrounds-97fe2ed9b8f1

