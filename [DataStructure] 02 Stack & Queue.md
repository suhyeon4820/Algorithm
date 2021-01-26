### 스택(Stack) & 큐(Queue)

***

#### 1. 스택(Stack)

>가장 마지막에 들어간 데이터가 가장 먼저 나오는 구조 (입력과 출력 방향이 같음)

- 특징 : 스택은 LIFO(Last In, Fisrt Out) 데이터 관리 방식을 따름

  - LIFO: 마지막에 넣은 데이터를 가장 먼저 추출하는 데이터 관리 정책
  - 대표적인 스택의 활용 : 컴퓨터 내부의 프로세스 구조의 함수 동작 방식
    
    - 함수의 콜스택, 문자열 역순 출력, 연산자 후위표기법
  
    <img src = "image\02\02.svg" width = "500"/>

- 장점
  - 구조가 단순해서 구현이 쉬움
  - 데이터 저장/읽기 속도가 빠름
- 단점 (일반적인 스택 구현시)
  - 데이터 최대 갯수를 미리 정해야 함 (큐에도 적용됨) -> 저장 공간의 낭비가 발생할 수 있음
  - 스택은 단순하고 빠른 성능을 위해 사용되어 배열 구조를 활용해 구현하는 것이 일반적임, 그래서 아래의 단점이 발생할 수 있음
    - **오버플로(Overflow)** : 특정한 자료구조가 수용할 수 있는 데이터의 크기를 이미 가득 찬 상태에서 삽입 연산을 수행할 때 발생
    - **언더플로(Underflow)** : 자료구조에 데이터가 전혀 들어 있지 않은 상태에서 삭제 연산을 수행하면 데이터가 전혀 없는 상태

- 주요 기능

  |  기능  |                  내용                  | 시간복잡도 |
  | :----: | :------------------------------------: | :--------: |
  | push() |       데이터를 스택에 넣는 작업        |    O(1)    |
  | pop()  |     데이터를 스택에서 꺼내는 작업      |    O(1)    |
  | peek() | 맨 위의 데이터 값만 가져오기 (삭제 X_) |    O(1)    |

  <img src = "image\02\01.png" width = "600"/>

- Swift코드

  ```swift
  public struct Stack<T> {
    fileprivate var storage = [T]()
    
    public init() {}
  	// isEmpty 
    public var isEmpty: Bool {
      return self.storage.isEmpty
    }
  	// count
    public var count: Int {
      return self.storage.count
    }
  	// push
    public mutating func push(_ element: T) {
      self.storage.append(element)
    }
  	// pop
    public mutating func pop() -> T? {
      return self.storage.popLast()
    }
  	// peek
    public var peek: T? {
      return self.storage.last
    }
  }
  ```

  

#### 2. 큐(Queue)

>가장 먼저 넣은 데이터를 가장 먼저 꺼낼 수 있는 구조

- 음식점에서 가장 먼저 줄을 선 사람이 제일 먼저 음식점에 입장하는 것과 동일

- FIFO(First-In, First-Out) 방식으로 스택과 꺼내는 순서가 반대

  <img src = "image\02\03.png" width = "600"/>

- 기능
  
  |  기능   |            내용             | 시간복잡도 |
  | :-----: | :-------------------------: | :--------: |
  | Enqueue |   큐에 데이터를 넣는 기능   |    O(1)    |
  | Dequeue | 큐에서 데이터를 꺼내는 기능 |    O(n)    |

- Dequeue: 큐에서 데이터를 꺼내는 기능 -> reamoveFirst() -->우선순위 큐로 해서 removeLast()
  - 시간복잡도 : O(n) -> 맨 앞의 요소를 제거한 후 뒤의 요소들을 앞으로 한칸씩 이동
- Swift Code

```swift
public struct Queue<T> {
  fileprivate var array = [T]()

  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  public var front: T? {
    return array.first
  }
}
```












