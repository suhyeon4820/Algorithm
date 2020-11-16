### 힙(Heap)

***

>자료구조                                  

#### 1. 힙(Heap) 이란

- 정의 : 데이터에서 최댓값과 최솟값을 빠르게 찾기 위해 고안된 완전 이진 트리(Complete Binary Tree) -> **최대 / 최소 힙에서 root 노드 값을 가져옴**

  - 완전 이진 트리 
    - 노드를 삽입할 때 최하단 왼쪽 노드부터 차례대로 삽입하는 트리
    - 자식 노드 수 최대 2개

  <img src = "\image\08\01.png" width = "300"/>

- 힙을 사용하는 이유
  - 배열에 데이터를 넣고, 최댓값과 최솟값을 찾으려면 O(n) 이 걸림
  - 이에 반해 힙에 데이터를 넣고 최댓값과 최솟값을 찾으면 𝑂(𝑙𝑜𝑔𝑛) 이 걸림
    - 균형 트리의 모양이 수정될 때, 다시 이를 균형 트리로 만드는 시간복잡도가 배열에 비해 낮음
  - 우선순위 큐와 같이 최댓값 또는 최솟값을 빠르게 찾아야 하는 자료구조 및 알고리즘 구현 등에 활용됨



#### 2. 힙 (Heap) 구조

- 힙은 최댓값을 구하기 위한 구조 (최대 힙, Max Heap) 와, 최솟값을 구하기 위한 구조 (최소 힙, Min Heap) 로 분류할 수 있음

  - 최대 힙의 경우 : 각 노드의 값은 해당 노드의 자식 노드가 가진 값보다 크거나 같음
  - 최소 힙의 경우 : 각 노드의 값은 해당 노드의 자식 노드가 가진 값보다 크거나 작음

- 완전 이진 트리 형태를 가짐(자식 노드 최대 2개)

  <img src = "\image\08\02.png"/>

#### 3. 힙과 이진 탐색 트리의 공통점과 차이점

- 공통점: 힙과 이진 탐색 트리는 모두 이진 트리임
- 차이점:
  - 힙은 각 노드의 값이 자식 노드보다 크거나 같음(Max Heap의 경우)
  - *이진 탐색 트리는 왼쪽 자식 노드의 값이 가장 작고, 그 다음 부모 노드, 그 다음 오른쪽 자식 노드 값이 가장 큼*
  - **힙은 이진 탐색 트리의 조건인 자식 노드에서 작은 값은 왼쪽, 큰 값은 오른쪽이라는 조건은 없음**
    
    - 힙의 왼쪽 및 오른쪽 자식 노드의 값은 오른쪽이 클 수도 있고, 왼쪽이 클 수도 있음
    
    <img src = "\image\08\03.png"/>
- 이진 탐색 트리는 탐색을 위한 구조, 힙은 최대/최솟값 검색을 위한 구조 중 하나로 이해하면 됨



#### 코드 구현

##### 1. 힙 생성

- 배열을 트리로 표현 -> 이때 트리는 배열의 순서로 나열됨

  <img src = "\image\08\04.png" width = "500"/>

- 최대, 최소힙으로 정렬

  - 왼쪽 자식 노드 인덱스 : (i X 2) + 1
  - 오른쪽 자식 노드 인덱스 : (i X 2) + 2

- 최대힙으로 정렬 : 각 노드들은 인덱스(값)으로 표현

  - 전체 배열의 반 : 3
    - 2(5) : 자식노드가 있지만 자신보다 작아 넘어감
    - 1(8) : 자식노드가 있고 자신보다 값이 커 4(9)교환 = 1(8), 4(9) -> 1(9), 4(8)
    - 0(2) : 자식노드가 있고 자신보다 값이 커 1(9) 교환 = 0(2), 1(9) -> 0(9), 1(2)
      - 바뀐 1(2) : 자식노드가 있고 자신보다 값이 커 4(8) 교환 = 1(2), 4(8) -> 1(8), 4(2)

  <img src = "\image\08\05.png" width = "500"/>

```swift
public struct Heap<T> {
    // array -> nodes
    var nodes = [T]()
    // tuple -> elements (두개 노드 비교, 최대힙/최소힙)
    private var orderCriteria: (T, T) -> Bool
    // empty heap 생성
    public init(sort: @escaping (T, T) -> Bool) {
        // 최대힙/최소힙 결정
        self.orderCriteria = sort
    }
    
    // 힙 생성 -> 배열을 트리로 표현
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array) // 아래 함수 호출
    }
  
    // 최대/최소 힙 생성 : O(n)
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
            shiftDown(i)
        }
    }
}    
```

- 최댓값 추출 및 삭제

  - 힙의 루트 노드 값에 마지막 노드의 값을 대입 후 마지막 노드를 삭제

  <img src = "\image\08\06.png" width = "500"/>
  
- 바뀐 루트 노드에 맞춰 전체 힙 정렬
  
    <img src = "\image\08\07.png" width = "700"/>

##### [ 전체 코드 ]

```swift

public struct Heap<T> {
    // array -> nodes
    var nodes = [T]()
    // tuple -> elements (두개 노드 비교, 최대힙/최소힙)
    private var orderCriteria: (T, T) -> Bool
    // empty heap 생성
    public init(sort: @escaping (T, T) -> Bool) {
        // 최대힙/최소힙 결정
        self.orderCriteria = sort
    }
    
    // 힙 생성 ?? -> 리스트를 트리로 표현
    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array) // 아래 함수 호출
    }
  
    // 최대/최소 힙 생성 : O(n)
    private mutating func configureHeap(from array: [T]) {
        nodes = array
        for i in stride(from: (nodes.count/2-1), through: 0, by: -1) {
            shiftDown(i)
        }
    }
    
    //**************************
    // 기능 추가
    //**************************
  
    // isEmpty
    public var isEmpty: Bool {
        return nodes.isEmpty
    }
    // count
    public var count: Int {
        return nodes.count
    }
    // peek(최소힙:최솟값, 최대힙:최댓값)
    public func peek() -> T? {
        return nodes.first
    }
    
    //**************************
    // Insert - O(log n)
    //**************************

    // 부모노드 (index0 : root node
    @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }
    // 자식노드(왼쪽, 2i+1)
    @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 1
    }
    // 자식노드(오른쪽, 2i-1)
    @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
        return 2*i + 2
    }
  
    
    //**************************
    // Insert - O(log n)
    //**************************
  
    // 배열에 요소를 추가하고 위로 올림(shiftUp)
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }
    
    // 현재 노드를 부모 노드보다 우선 순위가 높은 노드로 바꿈
    // if a parent is not larger(max-heap) or not smaller (min-heap) than the child, we exchange them
    internal mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = self.parentIndex(ofIndex: childIndex)
      
        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }
        nodes[childIndex] = child
    }
  
    //**************************
    // Replace
    //**************************
  
    public mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }
        remove(at: i)
        insert(value)
    }
  
  
    //**************************
    // Remove - O(log n)
    //**************************
  
    @discardableResult public mutating func remove() -> T? {
        // 1. 힙이 비어있으면 nil을 반환
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            // Use the last node to replace the first one, then fix the heap by shifting this new first node into its proper position.
            // 루트
            let value = nodes[0]
            // 마지막 요소와 루트를 바꾸고 루트를 삭제
            nodes[0] = nodes.removeLast()
            // 규칙을 준수하는지 루트부터 검사 시작
            shiftDown(0)
            return value
        }
    }
    // Removing from an arbitrary index
    @discardableResult public mutating func remove(at index: Int) -> T? {
        // 인덱스가 범위 내에 없으면 nil 반환
        guard index < nodes.count else { return nil }
        
        let size = nodes.count - 1
    
        if index != size {
            // 요소를 마지막 요소로 바꿈
            nodes.swapAt(index, size)
            shiftDown(from: index, until: size)
            shiftUp(index)
        }
        return nodes.removeLast()
    }
  
    // heapify
    internal mutating func shiftDown(from index: Int, until endIndex: Int) {
    
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1
    
        // Figure out which comes first if we order them by the sort function:
        // the parent, the left child, or the right child. If the parent comes
        // first, we're done. If not, that element is out-of-place and we make
        // it "float down" the tree until the heap property is restored.
    
        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
  
    internal mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}


//var heap = Heap(array: [3, 2, 5, 1, 7, 8, 2], sort: >)
var heap = Heap(array: [2, 8, 5, 3, 9, 1], sort: >)
print(heap)
// [8, 7, 5, 1, 2, 3, 2]
heap.remove(at: 0)
print(heap)
// [7, 2, 5, 1, 2, 3]


```

---

- https://devmjun.github.io/archive/Heap

- https://www.youtube.com/watch?v=2DmK_H7IdTo